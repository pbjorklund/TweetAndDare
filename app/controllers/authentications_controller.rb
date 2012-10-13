class AuthenticationsController < ApplicationController
	def create
		user = User.find_by_uid(env['omniauth.auth']['uid'])

		if !user
			user = User.create!(
				:uid => env['omniauth.auth']['uid'],
				:nickname => env['omniauth.auth']['info']['nickname'])
			user.auth = Auth.new(
				:oauth_token => env['omniauth.auth']['credentials']['token'], 
				:oauth_token_secret => env['omniauth.auth']['credentials']['secret']
			)
			user.save
		end

		if user
			session[:uid] = user.uid
			if session[:redirect_url]
				redirect_to session[:redirect_url]
			end
		else
			flash[:error] = "User not found"
		end
	end

	def log_out
		session[:uid] = nil
		redirect_to "/users"
	end
end
