require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  describe '#my_page' do
    before do
      sign_in(user)
    end
    it 'render correct page' do
      get my_page_path(user)
      expect(response).to render_template(:my_page)
    end
    it 'response has correct content type' do
      headers = { 'ACCEPT': 'text/javascript' }
      get my_page_path(user), params: { term: 'day' }, headers: headers
      expect(response.content_type).to eq('text/javascript; charset=utf-8')
    end
    it '@from be 7' do
      get my_page_path(user)
      from = assigns(:from)
      headers = { 'ACCEPT': 'text/javascript' }
      get my_page_path(user), params: { term: 'day', button: 'before' }, headers: headers
      expect(from + assigns(:from)).to eq 7
    end
  end
end
