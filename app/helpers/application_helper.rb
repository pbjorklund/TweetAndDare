module ApplicationHelper

	def twitter_link text
		raw link_to "@#{text}", "http://twitter.com/#{text}", :target => "_blank"
	end

	def pretty_state state
		state ||= Dare::STATES[:default]
		state_text = ""
		cls = ""
		case state
			when Dare::STATES[:new]
				state_text = "New"
			when Dare::STATES[:accepted]
				state_text = "Accepted"
				cls = "label-info"
	  		when Dare::STATES[:completed]
				state_text = "Completed"
				cls = "label-success"
	  		when Dare::STATES[:failed]
				state_text = "Failed"
				cls = "label-important"
		end
		raw "<span class='label #{cls}'>#{state_text}</span>"
	end
end
