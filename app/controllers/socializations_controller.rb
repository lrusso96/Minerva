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

  private

  def load_socializable
    @socializable = User.find_by_id(params[:user_id])
    session[:return_to] ||= request.referrer
  end
end
