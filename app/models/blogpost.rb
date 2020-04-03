class Blogpost < ApplicationRecord
	strip_attributes
	belongs_to :meter
	belongs_to :user
	validates :meter_id, presence: true
	validates :title, presence: true
	validates :content, presence: true
	default_scope -> {order(created_at: :desc)}
end