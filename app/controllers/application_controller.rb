class ApplicationController < ActionController::Base
	before_action :expire_hsts
	protect_from_forgery with: :exception
	include ApplicationHelper
	include SessionsHelper
	include UrlHelper


	rescue_from CanCan::AccessDenied do |exception|
	    respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to 'https://www.polimeter.org', notice: exception.message }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
  	end

	private

	# Confirms a logged-in user.
	def logged_in_user
		unless logged_in?
		store_location
		flash[:danger] = "Please log in."
		redirect_to login_url(:subdomain => false)
		end
	end



	private

	def find_meter
	   	@meter = Meter.where(subdomain: request.subdomain).first || Meter.where(domain: request.domain).first
	    authorize!(:show, @meter)
	end

	def bilingual?(path)
		puts "---------------check------------"
		path.first(2) == '/b'
	end

	def expire_hsts
		response.headers["Strict-Transport-Security"] = 'max-age=0'
	end

	def get_meter
		#puts "getting meter?" + request.subdomain
		meters = Meter.where(subdomain: request.subdomain)
		puts request.subdomain 
		if meters.count > 0
		puts "got meter"
		@meter = meters.first
		elsif request.subdomain != 'www'
		puts "no meter"
		#redirect_to root_url(subdomain:'www')
		end
	end

end