class User < ApplicationRecord
  has_one_attached :avatar
  after_create :default_image
  after_create :default_book_category
  has_many :study_books, class_name: 'BookRegister',
                         dependent: :destroy
  has_many :books, through: :study_books
  has_many :book_categories, dependent: :destroy
  has_many :status_with_books, dependent: :destroy
  has_many :microposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :active_notifications, class_name: 'Notification',
                                  foreign_key: 'visitor_id',
                                  dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification',
                                   foreign_key: 'visited_id',
                                   dependent: :destroy
  has_many :week_targets, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  validate :avatar_presence
  validates :name, presence: true, length: { maximum: 32 }
  validates :target_comment, length: { maximum: 400 }
  validates :introduction, length: { maximum: 1000 }

  def default_image
    avatar.attach(io: File.open(Rails.root.join('app/javascript/images/avatar-default.png')), filename: 'avatar-dafault.png', content_type: 'image/png')
  end

  def default_book_category
    book_categories.create(name: 'カテゴリーなし')
  end

  def avatar_presence
    errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください') if avatar.attached? && !avatar.content_type.in?(%('image/jpeg image/png'))
  end

  def self.keyword_search(id, search)
    users_except_yourself = joins(:microposts).select('users.id').where.not(id: id)
    searched_users = users_except_yourself.where(['name LIKE ? OR target_comment LIKE ? OR introduction LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    grouped_users = searched_users.group('microposts.user_id').maximum('microposts.studied_at')
    ordered_users = grouped_users.sort_by { |_k, v| v }.reverse.to_h
    find(ordered_users.keys)
  end

  def self.recommended_user(id, target, my_choice_university)
    users_except_yourself = joins(:microposts).select('users.id').where.not(id: id)
    recommended_user = if target == '大学受験合格' && my_choice_university
                         users_except_yourself.where(my_choice_university: my_choice_university).group('microposts.user_id').maximum('microposts.studied_at')
                       else
                         users_except_yourself.where(target: target).group('microposts.user_id').maximum('microposts.studied_at')
                       end
    ordered_users = recommended_user.sort_by { |_k, v| v }.reverse.to_h
    find(ordered_users.keys)
  end

  def a_week_study_time
    from = Time.current.at_beginning_of_day - 6.days
    to = Time.current

    total_times = microposts.all.where(studied_at: from...to).sum(:study_time)
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

  def self.feeds_of_users_with_same_target(id, target, my_choice_university)
    mircroposts_except_yourself = joins(:microposts).select('microposts.id').where.not(id: id)
    microposts = if target == '大学受験合格' && my_choice_university.present?
                   mircroposts_except_yourself.where(my_choice_university: my_choice_university)
                 else
                   mircroposts_except_yourself.where(target: target)
                 end

    micropost_ids = []

    microposts.each do |micropost|
      micropost_ids << micropost.id
    end

    Micropost.where(id: micropost_ids)
  end

  def like?(micropost)
    likes.find_by(micropost_id: micropost)
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    return if temp.present?

    notification = current_user.active_notifications.new(
      visited_id: id,
      action: 'follow'
    )
    notification.save if notification.valid?
  end

  def books_in_progress
    book_ids = status_with_books.where(status: 'in_progress').pluck(:book_id)
    books.where(id: book_ids)
  end
end
