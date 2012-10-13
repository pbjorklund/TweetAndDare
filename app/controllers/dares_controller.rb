class DaresController < ApplicationController
  def index
    @dare = Dare.new
  end

  def show
    @dare = fetch_dare
  end

  def create
    @dare = Dare.create! params[:dare]
    render :show
  end

  private

  def fetch_dare
    Dare.find params[:id]
  end
end
