class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  	def authenticated
  		if current_user
  			true
  		else
  			authenticate
  			false
  		end
  	end

	def authenticate		
		redirect_to "/auth/twitter"
	end

  	def current_user
  		if session[:uid]
  			@current_user = User.find_by_uid(session[:uid])
  		end
  	end
end
