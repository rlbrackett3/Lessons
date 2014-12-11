class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      flash[:notice] = "Yay! You are signed up!"
      redirect_to root_path
    else
      flash[:alert] = "Sorry, something went wrong, please try again."
      redirect_to :back
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end