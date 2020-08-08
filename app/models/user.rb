class User < ApplicationRecord
  has_one_attached :avatar
  before_create :default_image
  default_scope -> { order(created_at: :desc) }
  has_many :study_books, class_name: "BookRegister",
                              foreign_key: "user_id",
                              dependent:  :destroy
  has_many :books,  through: :study_books
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable

    def default_image
      self.avatar.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'avatar-default.png')), filename: 'avatar-dafault.png', content_type: 'image/png')
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
