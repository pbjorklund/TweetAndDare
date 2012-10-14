class VotesController < ApplicationController
  before_filter :authenticated

  respond_to :js
  def do
    @dare = Dare.find(params[:id])
    @dare.liked_by current_user
  end

  respond_to :js
  def dont
    @dare = Dare.find(params[:id])
    @dare.disliked_by current_user
  end
end
