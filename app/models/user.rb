class User < ApplicationRecord
  has_one_attached :avatar
  before_validation :default_image
  default_scope -> { order(created_at: :desc) }
  has_many :study_books, class_name: "BookRegister",
                              foreign_key: "user_id",
                              dependent:  :destroy
  has_many :books,  through: :study_books
  has_many :microposts, dependent: :destroy
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable
  validate :avatar_content_type
  validates :name, presence: true, length: {maximum: 32}
  # validates :target, presence: true
  validates :target_comment, length: {maximum: 400}
  validates :introduction, length: {maximum: 1000}

    def default_image
      self.avatar.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'avatar-default.png')), filename: 'avatar-dafault.png', content_type: 'image/png')
    end

    def avatar_content_type
      if !avatar.content_type.in?(%('image/jpeg image/png'))
        errors.add(:avatar, 'にはjpegまたはpngファイルを添付してください')
      end
    end

    def self.name_search(search)
      User.where(['name LIKE ?', "%#{search}%"])
    end

    def self.recommended_user(id, target, my_choice_university)
      unless target == "大学受験合格"
        User.where.not(id: id).where(target: target)
      else
        User.where.not(id: id).where(my_choice_university: my_choice_university)
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
end
