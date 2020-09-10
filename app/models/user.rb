class User < ApplicationRecord
  has_one_attached :avatar
  after_create :default_image
  after_create :default_book_category
  has_many :study_books, class_name: "BookRegister",
                              foreign_key: "user_id",
                              dependent:  :destroy
  has_many :books,  through: :study_books
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :active_notifications, class_name: 'Notification', 
                                  foreign_key: 'visitor_id', 
                                  dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', 
                                  foreign_key: 'visited_id', 
                                  dependent: :destroy
  has_many :week_targets, dependent: :destroy
  has_many :book_categories, dependent: :destroy
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable
  validate :avatar_presence
  # validate :avatar_content_type
  validates :name, presence: true, length: {maximum: 32}
  # validates :target, presence: true
  validates :target_comment, length: {maximum: 400}
  validates :introduction, length: {maximum: 1000}


    def default_image
      self.avatar.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'avatar-default.png')), filename: 'avatar-dafault.png', content_type: 'image/png')
    end

    def default_book_category
      book_categories.create(name: "カテゴリーなし")
    end

    def avatar_presence
      if avatar.attached?
        if !avatar.content_type.in?(%('image/jpeg image/png'))
          errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください')
        end
      end
    end

    def self.keyword_search(id, search)
      searched_users_in_hash = self.joins(:microposts).select("users.*, microposts.*").where.not(id: id).where(['name LIKE ? OR target_comment LIKE ? OR introduction LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"]).group("microposts.user_id").maximum("microposts.studied_at")
      ordered_users = searched_users_in_hash.sort_by{ |k, v| v }.reverse.to_h
      user_ids = ordered_users.keys
      self.find(user_ids)
    end

    def self.recommended_user(id, target, my_choice_university)
      if my_choice_university
        recommended_user_in_hash = self.joins(:microposts).select("users.*, microposts.*").where.not(id: id).where(my_choice_university: my_choice_university).group("microposts.user_id").maximum("microposts.studied_at")
      else
        recommended_user_in_hash = self.joins(:microposts).select("users.*, microposts.*").where.not(id: id).where(target: target).group("microposts.user_id").maximum("microposts.studied_at")
      end
      ordered_users = recommended_user_in_hash.sort_by{ |k, v| v }.reverse.to_h
      user_ids = ordered_users.keys
      self.find(user_ids)
    end

    def a_week_study_time
      from = Time.current.at_beginning_of_day - 6.day
      to = Time.current

      total_times = microposts.all.where(studied_at: from...to).sum(:studied_time_in_minutes)
      hours = total_times / 60
      minutes = total_times % 60
      "#{hours}時間#{minutes}分"
    end

    def register(book)
      books << book
    end
    
    def unregister(book)
      study_books.find_by(book_id: book.id).destroy
    end

    def register?(book)
      books.include?(book)
    end

    def follow(other_user)
      following << other_user
    end
  
    def unfollow(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end
  
    def following?(other_user)
      following.include?(other_user)
    end

    def feed
      following_ids = "SELECT followed_id FROM relationships
                      WHERE follower_id = :user_id"
      Micropost.where("user_id IN (#{following_ids})
                      OR user_id = :user_id", user_id: id)
    end

    def like?(micropost)
      likes.find_by(micropost_id: micropost)
    end

    def create_notification_follow!(current_user)
      temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
      if temp.blank?
        notification = current_user.active_notifications.new(
          visited_id: id,
          action: 'follow'
        )
        notification.save if notification.valid?
      end
    end
    
end
