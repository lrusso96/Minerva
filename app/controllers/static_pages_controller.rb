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
end
