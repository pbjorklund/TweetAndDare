class AuthenticationsController < ApplicationController
  def create
    user = User.create_or_find_from_omniauth(omniauth)
    session[:uid] = user.uid if user
    user ? flash[:notice] = "You signed in" : flash[:error] = "User not found"

    if session[:came_from]
      redirect_to session[:came_from]
    end

    if session[:initiated_dare]
      create_dare session[:initiated_dare]
      session[:initiated_dare] = nil
    elsif session[:redirect_url]
      redirect_to session[:redirect_url]
    else
      redirect_to root_path
    end

  end

  private

  def omniauth
    @omniauth ||= env['omniauth.auth']
  end
end
