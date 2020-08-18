class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :book, optional: true
  has_one_attached :picture
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
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

  def self.total_study_times
    total = self.sum(:studied_time_in_minutes)
    hours = total / 60
    minutes = total % 60
    return hours, minutes
  end

end
