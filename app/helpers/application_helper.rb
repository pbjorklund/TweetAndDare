module ApplicationHelper

	def twitter_link text
		raw link_to "@#{text}", "http://twitter.com/#{text}", :target => "_blank"
	end
end
