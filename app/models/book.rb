class Book < ApplicationRecord
  has_one_attached :icon
  default_scope -> { order(created_at: :desc) }
  has_many :owners, class_name: "BookRegister",
                              foreign_key: "book_id",
                              dependent:  :destroy
  has_many :users, through: :owners
  has_one :micropost
  validates :name, presence: true, uniqueness: true

  def self.name_search(search)
    Book.where(['name LIKE ?', "%#{search}%"])
  end

  def exist_same_name?
    Book.find_by(name: self.name)
  end
end
