class Book < ApplicationRecord
  has_one_attached :icon
  default_scope -> { order(created_at: :desc) }
  has_many :owners, class_name: "BookRegister",
                              foreign_key: "book_id",
                              dependent:  :destroy
  has_many :users, through: :owners
  has_many :microposts
  has_many :week_targets, dependent: :destroy
  has_many :status_with_books, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {maximum: 60}

  def self.name_search(search)
    Book.where(['name LIKE ?', "%#{search}%"])
  end
end
