require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates presence' do
    let(:user) { build(:user) }
    subject { user }
    context 'valid user' do
      it { is_expected.to be_valid }
    end
    context 'name is blank' do
      it {
        user.name = ''
        is_expected.not_to be_valid 
      }
    end
    context 'email is blank' do
      it {
        user.email = ''
        is_expected.not_to be_valid 
      }
    end
    context 'password is blank' do
      it {
        user.password = ''
        is_expected.not_to be_valid 
      }
    end
  end

  describe 'method' do
    let(:user) { create(:user) }
    let(:book) { create(:book) }
    let(:other_user) { create(:user) }
    it '#register(book)' do
      expect { user.register(book) }.to change { user.books.count }.by(1)
    end
    it '#follow(other_user)' do
      expect { user.follow(other_user) }.to change { user.following.count }.by(1)
    end
    describe '#create_notification_follow!(current_user)' do
      let(:followed) { create(:user) }
      let(:follower) { create(:user) }
      let(:notification) { create(:notification) }
      it 'create active_notifications' do
        expect { followed.create_notification_follow!(follower) }.to change { follower.active_notifications.count }.by(1)
      end
      it 'not create active_notifications' do
        notification.update(
          visitor_id: follower.id,
          visited_id: followed.id
        )
        expect(followed.create_notification_follow!(follower)).to be nil
      end
    end
  end
end