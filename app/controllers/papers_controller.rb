class PapersController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @papers = @user.papers.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @paper.user_id = @user.id
    # must re-authorize resource!
    authorize! :create, @paper
  end

  def create
    @paper = current_user.papers.build(paper_params)
    if @paper.save
      flash[:success] = "Paper created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :description, :article)
  end
end
