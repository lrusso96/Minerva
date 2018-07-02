# Handle user fields for secure assignement
class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password]
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :surname, :email, :password,
                                 :password_confirmation, :birthdate)
  end

  def account_update_params
    params.require(:user).permit(:name, :surname, :email, :birthdate, :password,
                                 :password_confirmation, :current_password,
                                 :country, :nickname, :website)
  end
end
