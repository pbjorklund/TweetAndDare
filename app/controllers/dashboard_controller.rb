class DashboardController < ApplicationController

	before_filter :authenticated

	def index
		@dares = []
		@dares.push Dare.new(:owner => current_user, :text => "eat strawberries", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "eat bananas", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "drive a car naked", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "kill hitler", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "write rspec tests", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "master the violin", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "swim the atlantic", :dared_user => current_user)
		@dares.push Dare.new(:owner => current_user, :text => "climb mount everest", :dared_user => current_user)
		@dares.size.times do |i|
			@dares[i].id = i
		end
	end
end
