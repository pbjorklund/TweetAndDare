class DaresController < ApplicationController
  def index
    @dare = Dare.new
  end

  def show
    @dare = fetch_dare
  end

  def create
    user = User.create!({nickname: params["dare"]["owner"]["nickname"]})
    @dare = Dare.create({text: params["dare"]["text"], owner: user })
    @dare.save!

    render :show
  end

  private

  def fetch_dare
    Dare.find params[:id]
  end
end
