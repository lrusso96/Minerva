class PapersController < ApplicationController
  # load_and_authorize_resource

  def index
    @user = User.find_by_id(params[:user_id])
    @papers = @user.papers.paginate(page: params[:page])
    authorize! :show, @papers
  end

  def show
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url if @user.nil?
    @paper = @user.papers.find_by_id(params[:id])
    redirect_to root_url if @paper.nil?
    authorize! :show, @paper
  end

  def new
    @user = User.find_by_id(params[:user_id])
    if @user.nil?
      redirect_to root_url
      return
    end
    @paper = Paper.new
    @paper.user_id = @user.id
    authorize! :create, @paper
  end

  def create
    @paper = current_user.papers.build(paper_params)
    art = params[:paper][:article]
    if art.nil?
      flash[:error] = 'Attach a file please!'
      redirect_to new_user_paper_url(current_user.id)
      return
    end
    @paper.article.attach(art)
    if @paper.save
      flash[:success] = 'Paper created!'
      redirect_to root_url
      return
    else
      render 'static_pages/home'
    end
  end

  def destroy
    paper = Paper.find_by_id(params[:id])
    authorize! :destroy, paper
    paper.destroy
    redirect_to root_url
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :description, :article, :field,
                                  :color)
  end
end
