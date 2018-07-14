require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test 'show his own comments to logged user' do
    c = FactoryBot.create(:comment)
    u = c.user
    sign_in(u)
    get user_paper_issue_url(c.issue.paper.user, c.issue.paper, c.issue)
    assert_response :success
    assert_template 'show'
  end

  test "redirect if comments not found" do
    c = FactoryBot.create(:comment)
    u = c.user
    sign_in(u)
    get user_paper_issue_url(user_id: 1, paper_id: 1, id: 100)
    assert_response :redirect
  end
end
