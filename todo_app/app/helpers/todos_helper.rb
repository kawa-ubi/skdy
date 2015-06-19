module TodosHelper
	def new_line(s)
		raw html_escape(s).gsub(/\n/, '<br>')
	end
end
