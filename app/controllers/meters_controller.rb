class MetersController < ApplicationController
	before_action :find_meter, only: [:show, :data, :about, :news, :rules, :updates, :analytics, :overview, :edit, :update, :destroy, :assign_user]
	load_and_authorize_resource


	before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]

	def show
		@bilingual = bilingual?(request.path)
		if @bilingual
			@promises = @meter.promises.order(:category, :subcategory_b, :description_b)
		else
			@promises = @meter.promises.order(:category, :subcategory, :description)
		end
	end

	def data
		created_user = @meter.user
		if created_user.has_role? :polimeter_premium
			render json: {
				meter: @meter,
				promises: @meter.promises.order(:category, :subcategory, :description)
			}
		else
			render json: {
				"status": "error",
				"message": "To view this meter's data, the meter owner must be registered for premium."
			}
		end
	end

	def dashboard
		@meter = current_user.meters.build
		@meters = current_user.meters

#		@free_meters = current_user.meters.where(meter_type: 'public')
#		@premium_meters = Meter.with_roles([:meter_admin, :meter_editor, :meter_viewer], current_user)
	end

	def overview
		@promises = @meter.promises
		@meter_members = User.with_role(:meter_member, @meter)
	end

	def new
		@meter = current_user.meters.build
	end

	def create
		# if current_user.has_role? :polimeter_premium
		if meter_params[:meter_type] == 'private' && current_user.has_role?(:polimeter_premium)
			attributes = meter_params.clone
			attributes[:subdomain] = meter_params[:name].gsub(/\s+/, "").mb_chars.downcase.gsub(/[ðłøß]/, "ð" => "d", "ł" => "l", "ø" => "o", "ß" => "ss").normalize(:kd).gsub(/[^\x00-\x7F]/n, "").to_s
			@meter = current_user.meters.build(attributes)
			@meter.meter_type = 'private'

			if @meter.save
				current_user.add_role :meter_admin, @meter
				flash[:success] = "Meter created"
				redirect_to root_url(:subdomain => attributes[:subdomain]) + "overview"
			else
				render "new"
			end
		else
			if current_user.meters.count >= 2 && !current_user.has_role?(:polimeter_premium)
				redirect_to new_meter_path
			else
				attributes = meter_params.clone
				attributes[:subdomain] = meter_params[:name].gsub(/\s+/, "").mb_chars.downcase.gsub(/[ðłøß]/, "ð" => "d", "ł" => "l", "ø" => "o", "ß" => "ss").normalize(:kd).gsub(/[^\x00-\x7F]/n, "").to_s
				@meter = current_user.meters.build(attributes)
				@meter.meter_type = 'public'
				if @meter.save
					flash[:success] = "Meter created"
					redirect_to root_url(:subdomain => attributes[:subdomain]) + "overview"
				else
					render "new"
				end
			end
		end
	end

	def edit
		# Meter Initialization handled by CanCanCan
	end

	def update
		attributes = meter_params.clone
		attributes[:subdomain] = meter_params[:name].gsub(/\s+/, "").mb_chars.downcase.gsub(/[ðłøß]/, "ð" => "d", "ł" => "l", "ø" => "o", "ß" => "ss").normalize(:kd).gsub(/[^\x00-\x7F]/n, "").to_s
		if @meter.update_attributes(attributes)
			flash[:success] = "Meter updated"
			redirect_to root_url(:subdomain => attributes[:subdomain]) + "overview"
		else
			render "edit"
		end
	end

	def assign_user
		@assigned_user = User.find_by_email(meter_params["assignment_email"])

		puts @assigned_user.inspect

		respond_to do |format|

			if @assigned_user
				puts "assign user"
				puts meter_params["assignment_role"]
				if meter_params["assignment_role"] == 'admin'
					@assigned_user.add_role :meter_admin, @meter
				elsif meter_params["assignment_role"] == 'editor'
					@assigned_user.add_role :meter_editor, @meter
				elsif meter_params["assignment_role"] == 'viewer'
					@assigned_user.add_role :meter_viewer, @meter
				else
					@message = "Assignment role not valid"
				end
			else
				@message = "User not found"
			end

			format.json { head :no_content }
			format.js
		end
	end

	def destroy
		@meter.destroy
		flash[:success] = "Meter deleted"
		redirect_to dashboard_url(subdomain: false)
	end

    def about
        @bilingual = bilingual?(request.path)
    end

	def news
		@blogposts = @meter.blogposts
	end

	def rules
		@bilingual = bilingual?(request.path)
	end

	def updates
		@promises = @meter.promises.order(created_at: :desc)
	end

    def analytics
		@promises = @meter.promises
	end

	private

	def meter_params
		params.require(:meter).permit(
			:name,
			:individual_name,
			:date_elected,
			:date_office,
			:show_date,
			:country,
			:province,
			:level,
			:facebook_key,
			:twitter_key,
			:disqus_key,
			:patreon_key,
			:image_logo,
			:image_politician,
			:description,
			:description_width,
			:about,
			:rules,
			:updates,
			:b_description,
			:b_about,
			:b_rules,
			:b_updates,
			:status1,
			:status2,
			:status3,
			:status4,
			:category1,
			:category2,
			:category3,
			:category4,
			:category5,
			:category6,
			:category7,
			:icon_category1,
			:icon_category2,
			:icon_category3,
			:icon_category4,
			:icon_category5,
			:icon_category6,
			:icon_category7,
			:default_category,
			:bilingual,
			:b_language,
			:b_status1,
			:b_status2,
			:b_status3,
			:b_status4,
			:b_category1,
			:b_category2,
			:b_category3,
			:b_category4,
			:b_category5,
			:b_category6,
			:b_category7,
			:direction,
			:b_direction,
			:text_days,
			:text_of,
			:text_about,
			:text_analytics,
			:text_blog,
			:text_rules,
			:b_text_about,
			:b_text_analytics,
			:b_text_blog,
			:b_text_rules,
			:b_text_days,
			:b_text_of,
			:assignment_email,
			:assignment_role,
			:google_analytics_code,
			:has_logs,
			:meter_type)
	end

	def bilingual?(path)
		path.first(2) === "/b"
	end

	def set_s3_direct_post
  	@s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
	end

end
