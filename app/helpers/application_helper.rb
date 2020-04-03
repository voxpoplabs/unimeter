module ApplicationHelper

	def initials(name)
		name_array = name.split
		name_array.size > 1 ? "#{name_array.first[0]}#{name_array.last[0]}" : name[0]
	end

	def date(time)
		time.try(:strftime, "%b %d, %Y")
	end

	def deactivate_code(invite_code)
		#set invite code as inactive.
		InviteCode.where(code: invite_code.code).update_all(active: false)	
	end
	
	def getStatusIcons(meter, bilingual)
		["", "fa-hourglass-start", "fa-cogs", "fa-check", "fa-ban"]
	end
	
	def getCategoryIcons(meter, bilingual)
		["", meter.icon_category1, meter.icon_category2, meter.icon_category3, meter.icon_category4, meter.icon_category5, meter.icon_category6, meter.icon_category7]
	end
	
	def getStatuses(meter, bilingual)
		if bilingual
			["", meter.b_status1, meter.b_status2, meter.b_status3, meter.b_status4]
		else
			["", meter.status1, meter.status2, meter.status3, meter.status4]
		end
	end

	def getCategories(meter, bilingual)
		if bilingual
			["", meter.b_category1, meter.b_category2, meter.b_category3, meter.b_category4, meter.b_category5, meter.b_category6, meter.b_category7]
		else
			["", meter.category1, meter.category2, meter.category3, meter.category4, meter.category5, meter.category6, meter.category7]
		end
	end

end