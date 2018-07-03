class IssuesController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url if @user.nil?
    @paper = @user.papers.find_by_id(params[:paper_id])
    redirect_to root_url if @paper.nil?
    @issues = @paper.issues.paginate(page: params[:page])
    @openers = @issues.map { |i| User.find_by_id(i.opener_id) }
    authorize! :show, @issues
  end

  def show
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url if @user.nil?
    @paper = @user.papers.find_by_id(params[:paper_id])
    redirect_to root_url if @paper.nil?
    @issue = @paper.issues.find_by_id(params[:id])
    redirect_to root_url if @issue.nil?
    @opener = User.find_by_id @issue.opener_id
    authorize! :show, @issue
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
    redirect_to session.delete(:return_to)
  end

  private

  def issue_params
    params.require(:issue).permit(:title, :description)
  end
end
