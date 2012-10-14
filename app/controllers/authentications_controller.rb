class AuthenticationsController < ApplicationController
  def create
    user = User.create_or_find_from_omniauth(omniauth)
    p user
    session[:uid] = user.uid if user
    user ? flash[:notice] = "You signed in" : flash[:error] = "User not found"

    redirect_to root_path
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
