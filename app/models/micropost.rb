class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  has_one_attached :picture
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  default_scope -> { order(studied_at: :desc) }
  validates :user_id, presence: true
  validates :studied_at, presence: true
  validates :how_many_studied_hours, presence: true
  validates :how_many_studied_minutes, presence: true
  validates :studied_time_in_minutes, presence: true
  validates :content, length: {maximum: 280}
  validate  :datetime_not_future_time
  validate  :studied_time_non_zero

  def datetime_not_future_time
    errors.add(:base, "勉強日時は現在までの日時を選択してください。") if studied_at > Time.now
  end
  def studied_time_non_zero
    errors.add(:base, "勉強時間は1分以上で入力してください。") if studied_time_in_minutes == 0
  end
end
