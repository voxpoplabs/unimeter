class ArticlesController < ApplicationController
	before_action :find_meter
	load_and_authorize_resource :promise
	load_and_authorize_resource :article, through: :promise

	def new
	end

	def create
		respond_to do |format|
			if @article.save
				Log.create(
					promise_id: @promise.id,
					action: "new article",
					article_reference: @article.id,
					old_status: @promise.status,
					new_status: @promise.articles.first.article_status
				)
				@promise.update_attribute(:status, @promise.articles.first.article_status)
				format.json { head :no_content }
				format.js
#				format.html { redirect_to meter_promise_url }
			else
				format.json { render json: @article.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @article.update(article_params)
				if @promise.status != @promise.articles.first.article_status
					Log.create(
						promise_id: @promise.id,
						action: "edit article",
						article_reference: @article.id,
						old_status: @promise.status,
						new_status: @promise.articles.first.article_status
					)
					@promise.update_attribute(:status, @promise.articles.first.article_status)
				end
				format.json { head :no_content }
				format.js
			else
				format.json { render json: @article.errors.full_messages, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@article.destroy
		respond_to do |format|
			Log.create(
				promise_id: @promise.id,
				action: "delete article",
				old_status: @promise.status,
				new_status: @promise.articles.count > 0 ? @promise.articles.first.article_status : 1
			)
			@promise.update_attribute(:status, @promise.articles.count > 0 ? @promise.articles.first.article_status : 1)
			format.js
			format.json { head :no_content }
		end
	end

	private

	def article_params
		params.require(:article).permit(:article_status, :date, :date_b, :link_name, :link_name_b, :link_url, :link_url_b, :title, :title_b, :paragraph1, :paragraph1_b, :paragraph2, :paragraph2_b, :paragraph3, :paragraph3_b, :note, :note_b)
	end

end