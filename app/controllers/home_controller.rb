class HomeController < ApplicationController

  def index
    @phone = session[:phone]
  end
  
end