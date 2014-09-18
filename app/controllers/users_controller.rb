class UsersController < ApplicationController
  def index
    @colors = ["red", "orange"]

    @users = User.all

    if @users.present?
      flash[:notice] = "Users present and accounted for."
    else
      flash[:alert] = "Sorry, there are no users to display."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy
    # puts "PARAMS ARE" + params.inspect
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "User deleted succesfully."
    else
      flash[:alert] = "There was a problem deleting the user."
    end
    redirect_to users_path
  end
end
