class MainController < ApplicationController
	before_action :force_json, only: :autocomplete 

	def home
		if logged_in?
			@meter = current_user.meters.build
		end
	end

	def autocomplete
		@meters = Meter.ransack(name_or_country_or_individual_name_cont: params[:q], meter_type_not_eq: "private").result(distinct: true).limit(5)
	end

	def search
		@meters = Meter.ransack(name_or_country_or_individual_name_cont: params[:q], meter_type_not_eq: "private").result(distinct: true)
#		@politicians = Meter.ransack(individual_name_cont: params[:q], meter_type_not_eq: "private").result(distinct: true)
	end

	private

	def force_json
		request.format = :json
	end
end