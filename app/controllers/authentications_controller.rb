class AuthenticationsController < ApplicationController
  def create
    user = User.create_or_find_from_omniauth(omniauth)
    session[:uid] = user.uid if user
    user ? flash[:notice] = "You signed in" : flash[:error] = "User not found"

    if session[:initiated_dare]
      dare_hash = Hash["dare", session[:initiated_dare]]
      create_dare dare_hash

      session[:initiated_dare] = nil
    else
      redirect_to root_path
    end

  end

  def log_out
    session[:uid] = nil
    redirect_to :root
  end

  private
  def omniauth
    @omniauth ||= env['omniauth.auth']
  end
end
