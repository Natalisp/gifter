class RegistrationsController < Devise::RegistrationsController

def sign_up_params
  params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
end


def account_update_params
   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
 end

end
