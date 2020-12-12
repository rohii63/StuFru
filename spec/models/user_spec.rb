require 'rails_helper'

RSpec.describe User, type: :model do
  it 'valid user' do
    user = User.new(name: 'a', email: 'test@test.com', password: 'password')
    expect(user).to be_valid
  end
end
