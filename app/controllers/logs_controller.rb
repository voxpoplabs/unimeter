class LogsController < ApplicationController
	before_action :find_meter
	load_and_authorize_resource :promise
	load_and_authorize_resource :log, through: :promise

	def index
		respond_to do |format|
			format.js
		end
	end

	private

end