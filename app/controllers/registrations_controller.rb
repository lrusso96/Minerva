# Handle user fields for secure assignement
class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :surname, :email, :password,
                                 :password_confirmation, :birthdate)
  end

  def account_update_params
    params.require(:user).permit(:name, :surname, :email, :birthdate, :password,
                                 :password_confirmation, :current_password)
  end
end
