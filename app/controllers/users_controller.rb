class UsersController < ApplicationController

	# before_filter :authenticated, :only => :show

	def index
		@users = User.all
	end

end