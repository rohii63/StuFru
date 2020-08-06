class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
end
