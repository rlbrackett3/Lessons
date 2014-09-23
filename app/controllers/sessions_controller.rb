class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Successfully signed in."
      redirect_to home_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully signed out."
    redirect_to home_path
  end

end
