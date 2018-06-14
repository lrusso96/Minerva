class PapersController < ApplicationController
  #load_and_authorize_resource

  def index
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url if @user.nil?
    @papers = @user.papers.paginate(page: params[:page])
  end

  def show
    @user = User.find_by_id(params[:user_id])
    redirect_to root_url if @user.nil?
    @paper = @user.papers.find_by_id(params[:id])
    redirect_to root_url if @paper.nil?
  end

  def new
    @user = User.find_by_id(params[:user_id])
    if @user.nil?
      redirect_to root_url
      return
    end
    @paper = Paper.new
    # must re-authorize resource!
    # authorize! :create, @paper
  end

  def create
    @paper = current_user.papers.build(paper_params)
    @paper.user_id = current_user.id
    art = params[:paper][:article]
    if art.nil?
      flash[:error] = 'Attach a file please!'
      redirect_to new_user_paper_url(current_user.id)
      return
    end
    @paper.article.attach(art)
    if @paper.save
      flash[:success] = "Paper created!"
      redirect_to root_url
      return
    else
      render 'static_pages/home'
    end
  end

  def destroy
    Paper.find_by_id(params[:id]).destroy
    redirect_to user_papers_url
  end

  private

  def paper_params
    params.require(:paper).permit(:title, :description, :article)
  end
end
