class BlogpostsController < ApplicationController
	before_action :find_meter
	load_and_authorize_resource :blogpost, through: :meter

	def new
		# Blogpost initialized by CanCanCan
	end

	def create
		@blogpost.user = current_user
		respond_to do |format|
			if @blogpost.save
				format.json { head :no_content }
				format.js
			else
				format.json { render json: @blogpost.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end

	def edit
		# Blogpost initialized by CanCanCan
	end

	def update
		respond_to do |format|
			if @blogpost.update(blogpost_params)
				format.json { head :no_content }
				format.js
			else
				format.json { render json: @blogpost.errors.full_messages, status: :unprocessable_entity }
	  		end
		end
	end

	def destroy
		@blogpost.destroy
		respond_to do |format|
			format.js
			format.html { redirect_to meter_promise_url }
			format.json { head :no_content }
		end
	end

	private

	def blogpost_params
		params.require(:blogpost).permit(:title, :content)
	end


end