class HomeController < ApplicationController

  def index
    @transactions = [
                      { amount: 10, date: Time.now },
                      { amount: 20, date: Time.now - 2.days }
                    ]
    end

  def about

  end
end
