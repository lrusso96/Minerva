class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @papers = current_user.papers.last(5).reverse
    end
  end

  def help
  end

  def contact
  end

  def about
  end
end
