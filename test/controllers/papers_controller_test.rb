require 'test_helper'

class PapersControllerTest < ActionDispatch::IntegrationTest
  test 'show his own papers index to logged user' do
    p = FactoryBot.create(:paper)
    u = p.user
    sign_in(u)
    get user_papers_url(u)
    assert_response :success
    assert_template 'index'
  end

  test 'show other papers index to logged user' do
    a = FactoryBot.create(:admin)
    p = FactoryBot.create(:paper)
    u = p.user
    p.user_id = a.id
    sign_in(u)
    get user_papers_url(a)
    assert_response :success
    assert_template 'index'
  end

  test 'show his own paper to logged user' do
    p = FactoryBot.create(:paper)
    u = p.user
    sign_in(u)
    get user_paper_url(u, p)
    assert_response :success
    assert_template 'show'
  end

  test 'show other user paper to logged user' do
    u = FactoryBot.create(:user)
    p = FactoryBot.create(:paper_adm)
    sign_in(u)
    get user_paper_url(p.user, p)
    assert_response :success
    assert_template 'show'
  end

  test "don't show not existing (overall) paper" do
    p = Paper.new
    p.id = 123
    u = FactoryBot.create(:user)
    sign_in(u)
    get user_paper_url(u, p)
    assert_response :redirect
  end

  test "don't show paper of some user who did not upload it" do
    u = FactoryBot.create(:user)
    p = FactoryBot.create(:paper_adm)
    sign_in(u)
    get user_paper_url(u, p)
    assert_response :redirect
  end
end
