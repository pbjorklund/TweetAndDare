module ApplicationHelper

	def twitter_link text
		raw link_to "@#{text}", "http://twitter.com/#{text}", :target => "_blank"
	end

	def pretty_state state
		state ||= Dare::STATE_NEW
		state_text = ""
		cls = ""
		case state
			when Dare::STATE_NEW
				state_text = "New"
			when Dare::STATE_ACCEPTED
				state_text = "Accepted"
				cls = "info"
	  		when Dare::STATE_COMPLETED
				state_text = "Completed"
				cls = "success"
	  		when Dare::STATE_FAILED
				state_text = "Failed"
				cls = "important"
		end
		raw "<span class='label label-#{cls}'>#{state_text}</span>"
	end
end
