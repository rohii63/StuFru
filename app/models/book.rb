class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true

  def self.name_search(search)
    Book.where(['name LIKE ?', "%#{search}%"])
  end
end
