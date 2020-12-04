require 'test_helper'

class BookRegistersControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get book_registers_create_url
    assert_response :success
  end
end
