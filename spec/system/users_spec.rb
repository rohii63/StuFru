require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  it 'update introduction' do
    sign_in(user)
    visit user_path(user)
    click_link 'test_id'
    fill_in '自己紹介', with: '自己紹介を更新'
    click_button '保存'
    expect(page).not_to have_button '保存'
    expect(page).to have_selector 'p', text: '自己紹介を更新'
  end
end
