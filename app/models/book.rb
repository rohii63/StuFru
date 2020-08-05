class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  before_create :default_image
  default_scope -> { order(created_at: :desc) }

  def default_image
    self.avatar.attach(io: File.open(Rails.root.join('app', 'javascript', 'images', 'book-icon-default-image.png')), filename: 'book-icon-default-image.png', content_type: 'image/png')
  end
end
