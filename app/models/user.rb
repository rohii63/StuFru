class User < ApplicationRecord
  has_one_attached :avatar
  after_create :default_image
  default_scope -> { order(created_at: :desc) }
  has_many :study_books, class_name: "BookRegister",
                              foreign_key: "user_id",
                              dependent:  :destroy
  has_many :books,  through: :study_books
  has_many :microposts, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                  dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
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

    def avatar_presence
      if avatar.attached?
        if !avatar.content_type.in?(%('image/jpeg image/png'))
          errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください')
        end
      end
    end

    def self.name_search(search)
      User.where(['name LIKE ?', "%#{search}%"])
    end

    def self.recommended_user(id, target, my_choice_university)
      if my_choice_university
        User.where.not(id: id).where(my_choice_university: my_choice_university)
      else
        User.where.not(id: id).where(target: target)
      end
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

end
