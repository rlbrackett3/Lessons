class TweetsController < ApplicationController
  layout 'app2'

  def index

  end

  def show
    @tweet = params[:id]
  end
end
