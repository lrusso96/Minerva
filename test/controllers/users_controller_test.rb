require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'show index to logged user' do
    u = FactoryBot.create(:user)
    sign_in(u)
    get users_url
    assert_response :success
    assert_template 'index'
  end

  test "don't show index to not logged user" do
    u = FactoryBot.create(:user)
    u.password = 'wrong_password'
    sign_in(u)
    get users_url
    assert_response :redirect
  end

  test 'show his own profile page to logged user' do
    u = FactoryBot.create(:user)
    sign_in(u)
    get user_url(u)
    assert_response :success
    assert_template 'show'
  end

  test 'show other profile pages to logged user' do
    a = FactoryBot.create(:admin)
    u = FactoryBot.create(:user)
    sign_in(u)
    get user_url(a)
    assert_response :success
    assert_template 'show'
  end
end
