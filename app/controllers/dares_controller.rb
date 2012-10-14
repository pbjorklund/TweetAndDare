class DaresController < ApplicationController
  def index
    @dare = Dare.new
    @recent_dares = Dare.last(5)
  end

  def show
    @dare = fetch_dare
  end

  def create
    if current_user
      create_dare params["dare"]
    else
      session[:initiated_dare] = params["dare"]
      redirect_to "/auth/twitter"
    end
  end

  def update
    @dare = Dare.find(params[:id])
    @dare.state = params[:dare][:state]

    if @dare.state > Dare::STATES[:new] && current_user && (@dare.target == "@#{current_user.nickname}" or @dare.target.starts_with?("#") or @dare.owner == current_user)
      if (@dare.target == "@#{current_user.nickname}" or @dare.target.starts_with?("#")
        @dare.dared_user = current_user
      end
      if @dare.save
        flash[:success] = "State updated"
      else
        flash[:error] = "Could not update state"
      end
      redirect_to :action => :show, :id => params[:id]
    else
      session[:redirect_url] = "/dares/#{params[:id]}"
      redirect_to "/auth/twitter"
    end
  end

  private
    def fetch_dare
      Dare.find params[:id]
    end
end
