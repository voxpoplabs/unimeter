class Subdomain
	def self.matches?(request)
		request.domain != "polimeter.org" && request.domain != "voxpop.local" || (request.subdomain.present? && request.subdomain != "www")
	end
end