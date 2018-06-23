class StaticPagesController < ApplicationController
  def home
    return unless user_signed_in?
    @papers = current_user.papers.last(5).reverse
    followees = current_user.followees(User)
    @feed_papers = Paper.where(user_id: followees.map(&:id)).last(5).reverse
  
  end

  def help
  end

  def contact
  end

  def about
  end

  def explore
    query = params[:query]
    @found_papers = MinervaApi::Arxiv.search(query) if query
    @top_papers = Paper.order(:likers_count).last(5).reverse
    @recent_papers = Paper.order(:created_at).last(5).reverse
  end

end
