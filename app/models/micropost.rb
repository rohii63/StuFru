class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  has_one_attached :picture
  default_scope -> { order(studied_at: :desc) }
  validates :user_id, presence: true
  validates :studied_at, presence: true
  validates :studied_time, presence: true
end
