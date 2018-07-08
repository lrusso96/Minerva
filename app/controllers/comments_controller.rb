class CommentsController < ApplicationController
  def new
    @user = User.find_by_id(params[:user_id])
    @user.nil? && redirect_to(root_url) && return
    @paper = @user.papers.find_by_id(params[:paper_id])
    @paper.nil? && redirect_to(root_url) && return
    @issue = @paper.issues.find_by_id(params[:issue_id])
    @issue.nil? && redirect_to(root_url) && return
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.issue_id = @issue.id
    authorize! :create, @comment
  end

  def create
    session[:return_to] ||= request.referrer
    user_signed_in? || (redirect_to(session.delete(:return_to)) && return)
    issue = Issue.find_by_id(params[:issue_id])
    @comment = issue.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to root_url
      return
    else
      render 'static_pages/home'
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    comment.nil? && redirect_to(root_url) && return
    authorize! :destroy, comment
    comment.destroy
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
