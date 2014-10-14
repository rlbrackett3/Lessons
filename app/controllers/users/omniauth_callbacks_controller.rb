class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # before_filter :configure_permitted_parameters

  # def facebook
  #   # You need to implement the method below in your model (e.g. app/models/user.rb)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])

  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end

  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    puts request.env["omniauth.auth"]
    @user = User.find_for_github_oauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
    end
  end

  protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up).push(:provider, :uid)
  #   # {|u| u.permit(:email, :password, :password_confirmation, :provider, :uid)}
  #   # .push(:provider, :uid)
  # end
end
