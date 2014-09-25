class HomeController < ApplicationController

  def index

  end

  def search
    # query = params[:user][:name]
    q = params[:query]
    @users = User.where("name like ?", "%#{q}%")
  end

end
