class HomeController < ApplicationController

  def index

  end

  def search
    query = params[:user][:name]
    @users = User.where("name like ?", "%#{query}%")
  end

end
