class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:notice] = "Welcome to the site!"
      session[:user_id] = @user.id
      session[:phone] = params[:phone] if params[:phone]
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  def destroy
    
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :phone)
    end

end