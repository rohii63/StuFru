class Book < ApplicationRecord
  has_one_attached :icon
  default_scope -> { order(created_at: :desc) }
  has_many :owners, class_name: "BookRegister",
                              foreign_key: "book_id",
                              dependent:  :destroy
  has_many :users, through: :owners
  has_many :microposts
  has_many :week_targets
  validates :name, presence: true, uniqueness: true

  def self.name_search(search)
    Book.where(['name LIKE ?', "%#{search}%"])
  end
end
