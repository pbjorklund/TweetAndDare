class SessionsController < ApplicationController

  def destroy
    session[:uid] = nil
    redirect_to :root
  end

end
