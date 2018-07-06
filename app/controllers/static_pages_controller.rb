class StaticPagesController < ApplicationController
  def home
    return unless user_signed_in?
    @papers = current_user.papers.last(5).reverse
    authorize! :show, @papers
    followees = current_user.followees(User)
    @feed_papers = Paper.where(user_id: followees.map(&:id)).last(5).reverse
    @starred_papers = current_user.likees(Paper).last(5).reverse
    @followers = current_user.followers(User).reverse
    @followees = current_user.followees(User).reverse
  end

  def help
  end

  def contact
  end

  def about
  end

  def explore
    query = params[:query]
    if query
      @found_papers = MinervaApi::Arxiv.search(query)
      authorize! :show, @found_papers
    end
    @sp = current_user.likees(Paper).last(5).reverse
    @top_papers = Paper.order(:likers_count).last(5).reverse
    @recent_papers = Paper.order(:created_at).last(5).reverse
    @matching_papers = Paper.where('description LIKE ? OR title LIKE ?',
                                   "%#{query}%", "%#{query}%")
  end
end
