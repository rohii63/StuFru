class WeekTarget < ApplicationRecord
  belongs_to :user
  belongs_to :book
  default_scope -> { order(created_at: :desc) }
  validates :content, numericality: { greater_than_or_equal_to: 1, allow_nil: true }, presence: true
  validate :start_page_and_end_page_not_blank
  validate :start_page_not_blank
  validate :end_page_not_blank
  validate :end_page_greater_than_start_page

  def start_page_and_end_page_not_blank
    errors.add(:範囲, 'を入力してください。') if content == 10000
  end

  def start_page_not_blank
    errors.add(:開始ページ, 'を入力してください。') if content == 10001
  end

  def end_page_not_blank
    errors.add(:終了ページ, 'を入力してください。') if content == 10002
  end

  def end_page_greater_than_start_page
    errors.add(:終了ページ, 'は開始ページよりも大きい必要があります。') if content == 10003
  end

  def self.at_this_week
    from = Time.current.at_beginning_of_week
    to = Time.current.at_end_of_week
    where(created_at: from...to)
  end

  def self.past_records(n)
    from = Time.current.at_beginning_of_week - n.week
    to = Time.current.at_end_of_week - n.week

    where(created_at: from...to) if where(created_at: from...to).any?
  end
end
