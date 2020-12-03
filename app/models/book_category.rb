class BookCategory < ApplicationRecord
  has_many :books
  belongs_to :user

  validates :name, presence: true, length: { maximum: 30 }
end
