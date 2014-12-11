class SessionsController < ApplicationController
  def new
    
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "You are signed in!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "Sorry, please try again."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end
end