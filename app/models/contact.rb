class Contact < ApplicationRecord
	strip_attributes
	validates :description, presence: true, length: {minimum: 4, maximum: 1000}
	validates :name, presence: true, length: {minimum: 4, maximum: 50}, format: {with: /\A[\p{Latin}\s]+\z/, :message => "may only contain alphanumeric characters"}
	default_scope -> {order(created_at: :desc)}

	def send_contact_email
		UserMailer.contact_form(self).deliver_now
	end
end