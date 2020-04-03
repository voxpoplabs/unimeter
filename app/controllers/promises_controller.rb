class PromisesController < ApplicationController
	before_action :find_meter
	load_and_authorize_resource :promise, through: :meter
	
	def show
		@articles = @promise.articles
		@bilingual =  bilingual?(request.path)
	end
	
	def new
		#Promise Initialization Handled By CanCanCan
		puts "creating new promise"
	end

	def create
		attributes = promise_params.clone
		attributes[:status] = 1
		@promise = @meter.promises.build(attributes)
		respond_to do |format|
			if @promise.save
				format.json { head :no_content }
				format.js
			else
				format.html { render action: "new" }
				format.js   { render json: @promise.errors }
			end
		end
	end

	def edit
		#Promise Initialization Handled By CanCanCan
	end

	def update
		# @promise = Promise.find(params[:id])
		respond_to do |format|
			if @promise.update_attributes(promise_params)
				format.json { head :no_content }
				format.js
			else
				format.html { render action: "edit" }
				format.js   { render json: @promise.errors }
			end
		end
	end

	def destroy
		@promise.destroy
		redirect_to root_url
	end

	private

	def promise_params
		params.require(:promise).permit(:category, :description, :description_b, :subcategory, :subcategory_b, :source_date, :source_date_b, :source_link_name, :source_link_name_b, :source_link_url, :source_link_url_b, :source_section, :source_section_b)
	end

end