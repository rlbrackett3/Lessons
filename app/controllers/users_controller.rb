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
    @user = User.new
  end

  # /users/:id/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    puts "====== PARAMS ARE ======" + params.inspect

    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created successfully."
      redirect_to user_path @user
    else
      flash[:alert] = "There was a problem creating your account."
      redirect_to new_user_path
    end

  end

  def update
    @user = User.find(params[:id])
    if @user.update(params[:user])
      flash[:notice] = "Your account was updated successfully."
      redirect_to user_path @user
    else
      flash[:alert] = "There was a problem updating your account."
      redirect_to edit_user_path
    end
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
