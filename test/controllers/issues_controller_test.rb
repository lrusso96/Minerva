require 'test_helper'

class IssuesControllerTest < ActionDispatch::IntegrationTest
  test 'show issue index to the author of that paper' do
    i = FactoryBot.create(:issue)
    u = i.paper.user
    sign_in(u)
    get user_paper_issues_url(u, i.paper)
    assert_response :success
    assert_template 'index'
  end

  test 'show issue index to other user' do
    i = FactoryBot.create(:issue_adm)
    u = FactoryBot.create(:user)
    sign_in(u)
    get user_paper_issues_url(i.paper.user, i.paper)
    assert_response :success
    assert_template 'index'
  end

  test 'show his own issues to logged user' do
    i = FactoryBot.create(:issue)
    u = i.paper.user
    sign_in(u)
    get user_paper_issue_url(u, i.paper, i)
    assert_response :success
    assert_template 'show'
  end

  test 'show other issues to logged user' do
    i = FactoryBot.create(:issue_adm)
    a = i.paper.user
    u = FactoryBot.create(:user)
    sign_in(u)
    get user_paper_issue_url(a, i.paper, i)
    assert_response :success
    assert_template 'show'
  end

  test 'cant close issue if i am not the opener nor the author of the paper' do
    i = FactoryBot.create(:issue_adm)
    a = i.paper.user
    u = FactoryBot.create(:user)
    sign_in(u)
    post user_paper_issue_close_url(a, i.paper, i)
    assert_response :redirect
    assert_not i.reload.closed
  end

  test 'close issue if i am the opener or the author of the paper' do
    i = FactoryBot.create(:issue)
    u = i.paper.user
    sign_in(u)
    post user_paper_issue_close_url(u, i.paper, i)
    assert_response :redirect
    assert i.reload.closed
  end
end
