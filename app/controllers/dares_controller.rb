class DaresController < ApplicationController
  def index
    @dare = Dare.new
    @recent_dares = Dare.last(5)
    @popular_dares = Dare.get_most_popular
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

    if current_user
      if current_user == @dare.owner
        # can set state to completed, failed IF state is accepted
        if @dare.state == Dare::STATES[:completed] or @dare.state == Dare::STATES[:failed]
          if @dare.save
            flash[:success] = "State updated"
          else
            flash[:error] = "Error updating state"
          end
        else
          flash[:error] = "You cannot accept this dare!"
        end
      elsif "@#{current_user.nickname.downcase}" == @dare.target.downcase or @dare.target.starts_with?("#")
        # can set state to accepted IF state is new
        if @dare.state == Dare::STATES[:accepted]
          @dare.dared_user = current_user
          if @dare.save
            flash[:success] = "State updated"
          else
            flash[:error] = "Error updating state"
          end
        else
          flash[:error] = "You cannot change this dare!"
        end
      end
    else
      session[:redirect_url] = "/dares/#{params[:id]}"
      redirect_to "/auth/twitter"
      return
    end
    redirect_to :action => :show, :id => params[:id]
  end

  private
    def fetch_dare
      Dare.find params[:id]
    end
end
