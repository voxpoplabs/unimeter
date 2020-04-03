class Meter < ApplicationRecord
	extend FriendlyId
	strip_attributes
	friendly_id :subdomain
	belongs_to :user
	has_many :promises, dependent: :destroy
	has_many :articles, through: :promises
	has_many :logs, through: :promises
	has_many :blogposts, dependent: :destroy
	validates :user_id, presence: true
	validates :name, presence: true, length: {minimum: 4, maximum: 50}, format: {with: /\A[\p{Latin}\s]+\z/, :message => "may only contain alphanumeric characters"}
	validates :subdomain, presence: true, uniqueness: {case_sensitive: false}, format: {with: /\A[a-zA-Z0-9]*\z/, :message => "may have no special characters (will be fixed when you fix the name)"}
	validates :domain, exclusion: {in: %w(polimeter.org), :message => "is invalid"}
	validates :country, presence: true
	validates :category1, presence: true
	default_scope -> {order(created_at: :desc)}

	attr_accessor :assignment_email
	
	resourcify

end