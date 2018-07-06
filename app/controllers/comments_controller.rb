class CommentsController < ApplicationController
  def new
    @user = User.find_by_id(params[:user_id])
    if @user.nil?
      redirect_to root_url
      return
    end
    @paper = @user.papers.find_by_id(params[:paper_id])
    if @paper.nil?
      redirect_to root_url
      return
    end
    @issue = @paper.issues.find_by_id(params[:issue_id])
    if @issue.nil?
      redirect_to root_url
      return
    end
    @comment = Comment.new
    @comment.user_id = current_user.id
    @comment.issue_id = @issue.id
    authorize! :create, @comment
  end

  def create
    session[:return_to] ||= request.referrer
    redirect_to session.delete(:return_to) unless current_user
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
    authorize! :destroy, comment
    comment.destroy
    redirect_to root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
