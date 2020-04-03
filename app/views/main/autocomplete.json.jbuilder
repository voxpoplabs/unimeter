json.meters do
	json.array!(@meters) do |meter|
		json.name meter.name
		json.subdomain meter.subdomain
		json.country meter.country
		json.province meter.province
	end
end