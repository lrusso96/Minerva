class IssuesController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url && return if @user.nil?
    @paper = @user.papers.find_by_id(params[:paper_id])
    redirect_to root_url && return if @paper.nil?
    @issues = @paper.issues.paginate(page: params[:page])
    authorize! :show, @issues
    @openers = @issues.map { |i| User.find_by_id(i.opener_id) }
  end

  def show
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url && return if @user.nil?
    @paper = @user.papers.find_by_id(params[:paper_id])
    redirect_to root_url && return if @paper.nil?
    @issue = @paper.issues.find_by_id(params[:id])
    redirect_to root_url && return if @issue.nil?
    authorize! :show, @issue
    @opener = User.find_by_id @issue.opener_id
    @comments = @issue.comments
  end

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
    @issue = Issue.new
    @issue.opener_id = current_user.id
    @issue.paper_id = @paper.id
    authorize! :create, @issue
  end

  def create
    paper = Paper.find_by_id(params[:paper_id])
    @issue = paper.issues.build(issue_params)
    @issue.opener_id = current_user.id
    if @issue.save
      flash[:success] = 'Issue created!'
      redirect_to root_url
      return
    else
      render 'static_pages/home'
    end
  end

  def destroy
    issue = Issue.find_by_id(params[:id])
    authorize! :destroy, issue
    issue.destroy
    redirect_to root_url
  end

  def close
    session[:return_to] ||= request.referrer
    issue = Issue.find_by_id(params[:issue_id])
    authorize! :destroy, issue
    issue.update_attribute(:closed, true)
    if session[:return_to]
      redirect_to session.delete(:return_to)
    else
      redirect_to root_url
    end
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
