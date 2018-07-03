class CommentsController < ApplicationController
  def create
    session[:return_to] ||= request.referrer
    redirect_to session.delete(:return_to) unless current_user
    issue = Issue.find_by_id(params[:issue_id])
    @comment = issue.comments.build(comment_params)
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
