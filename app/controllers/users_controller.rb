class UsersController < ApplicationController

  def index
    if params[:query]
      @users = User.where("email like ?", 
                          "%#{params[:query]}%")
      # @users = User.where(email: params[:query])
    else
      @users = User.all
    end
  end
  
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Yay, User created!"
      redirect_to user_path @user
    else
      flash[:alert] = " FAIL "
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      flash[:notice] = "User updated successfully!"
      redirect_to @user
    else
      flash[:alert] = "Fail*2"
      redirect_to edit_user_path @user
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      flash[:notice] = "User destroyed"
    else
      flash[:alert] = "Something went worng, User still exists."
    end
    redirect_to root_path
  end 

  # HERE ARE PRIVATE METHODS
  private

  def user_params
    params.require(:user).permit( :lname, 
                                  :fname, 
                                  :email, 
                                  :password)
  end

end