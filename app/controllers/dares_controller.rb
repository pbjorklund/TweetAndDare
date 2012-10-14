class DaresController < ApplicationController
  def index
    @dare = Dare.new
  end

  def show
    @dare = fetch_dare
  end

  def create
    if current_user
      create_dare params
    else
      session[:initiated_dare] = params["dare"]
      redirect_to "/auth/twitter"
    end
  end

  private

  def fetch_dare
    Dare.find params[:id]
  end
end
