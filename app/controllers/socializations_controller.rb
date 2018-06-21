# socializations_controller.rb
class SocializationsController < ApplicationController
  before_action :load_socializable

  def follow
    current_user.follow!(@socializable)
    redirect_to session.delete(:return_to)
  end

  def unfollow
    current_user.unfollow!(@socializable)
    redirect_to session.delete(:return_to)
  end

  def star
    current_user.like!(@socializable)
    redirect_to session.delete(:return_to)
  end

  def unstar
    current_user.unlike!(@socializable)
    redirect_to session.delete(:return_to)
  end

  private

  def load_socializable
    session[:return_to] ||= request.referrer
    if id = params[:paper_id] # Must be before :item_id, since it's nested under it.
      @socializable = Paper.find(id)
    else
      @socializable = User.find_by_id(params[:user_id])
    end
  end
end