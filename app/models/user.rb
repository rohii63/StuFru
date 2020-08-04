class User < ApplicationRecord
  has_one_attached :avatar
  before_create :default_image

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :confirmable

    def default_image
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'avatar-default.png')), filename: 'avatar-dafault.png', content_type: 'image/png')
    end

    def self.user_search(search)
      User.where(['name LIKE ?', "%#{search}%"])
    end

    def self.recommended_user(id, target, my_choice_university)
      unless target == "大学受験合格"
        User.where.not(id: id).where(target: target)
      else
        User.where.not(id: id).where(my_choice_university: my_choice_university)
      end
    end
end
