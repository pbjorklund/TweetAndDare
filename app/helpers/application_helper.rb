module ApplicationHelper

	def twitter_link text
    if text.match /^\#/i
      link_text = text
    elsif text.match /^\@/i
      link_text = text
      link_path = text.gsub(/^\@/i,"")
    else
      link_text = "@#{text}"
      link_path = text
    end
		raw link_to link_text, "http://twitter.com/#{text}", :target => "_blank"
	end

	def pretty_state state, selected = false
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
		checked = ""
		if selected
			checked = "<i class='icon-ok icon-white'></i>"
		end
		raw "<span class='label #{cls}'>#{state_text}" + checked + "</span>"
	end
end
