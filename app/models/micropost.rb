class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  has_one_attached :picture
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  default_scope -> { order(updated_at: :desc) }
  validates :content, length: {maximum: 280}
  validates :study_amount, numericality: { greater_than_or_equal_to: 1, allow_nil: true }
  validate  :datetime_not_future_time
  validate  :studied_time_non_zero
  validate  :study_time_limit_per_day
  validate  :start_page_greater_than_end_page

  def datetime_not_future_time
    errors.add(:studied_at, "は現在までの日時を選択してください。") if studied_at > Time.now
  end

  def studied_time_non_zero
    errors.add(:studied_time_in_minutes, "は1分以上で入力してください。") if studied_time_in_minutes == 0
  end

  def study_time_limit_per_day
    from = studied_at.at_beginning_of_day
    to = studied_at.at_end_of_day
    errors.add(:studied_time_in_minutes, "は1日24時間以内にして下さい。") if Micropost.where(user_id: user_id).where(studied_at: from...to).sum(:studied_time_in_minutes) + studied_time_in_minutes >= 1440
  end

  def start_page_greater_than_end_page
    errors.add(:終了ページ, "は開始ページより大きい値にして下さい。") if study_amount == 10000
  end

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and micropost_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        micropost_id: id,
        visited_id: user_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(micropost_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      micropost_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  def self.total_study_time
    total = self.sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes
  end

  def self.today_study_time
    from = Time.current.at_beginning_of_day
    to = Time.current.at_end_of_day
    from_in_yesterday = Time.current.at_beginning_of_day - 1.day
    to_in_yesterday = Time.current.at_end_of_day - 1.day

    total = self.where(studied_at: from...to).sum(:studied_time_in_minutes)
    total_in_yesterday = self.where(studied_at: from_in_yesterday...to_in_yesterday).sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes, total, total_in_yesterday
  end

  def self.this_week_study_time
    from = Time.current.at_beginning_of_week
    to = Time.current.at_end_of_week
    from_in_last_week = Time.current.at_beginning_of_week - 1.week
    to_in_last_week = Time.current.at_end_of_week - 1.week

    total = self.where(studied_at: from...to).sum(:studied_time_in_minutes)
    total_in_last_week = self.where(studied_at: from_in_last_week...to_in_last_week).sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes, total, total_in_last_week
  end

  def self.this_month_study_time
    from = Time.current.at_beginning_of_month
    to = Time.current.at_end_of_month
    from_in_last_month = Time.current.at_beginning_of_month - 1.month
    to_in_last_month = Time.current.at_end_of_month - 1.month

    total = self.where(studied_at: from...to).sum(:studied_time_in_minutes)
    total_in_last_month = self.where(studied_at: from_in_last_month...to_in_last_month).sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes, total, total_in_last_month
  end

  def self.daily_study_time(n)
    from = Time.current.at_beginning_of_day - n.day
    to = Time.current.at_end_of_day - n.day

    total = self.where(studied_at: from...to).sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes, total
  end

  def self.weekly_study_time(n)
    from = Time.current.at_beginning_of_week - n.week
    to = Time.current.at_end_of_week - n.week

    total = self.where(studied_at: from...to).sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes, total
  end

  def self.monthly_study_time(n)
    from = Time.current.at_beginning_of_month - n.month
    to = Time.current.at_end_of_month - n.month

    total = self.where(studied_at: from...to).sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes, total
  end

  def self.weekly_study_amount(book_id, study_unit, week_target_created_at)
    from = week_target_created_at.at_beginning_of_week
    to = week_target_created_at.at_end_of_week
    post = self.where(studied_at: from...to).where(book_id: book_id).where(study_unit: study_unit)
    
    study_unit == "時間" ? post.sum(:studied_time_in_minutes) : post.sum(:study_amount)
  end

end
