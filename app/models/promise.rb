class Promise < ApplicationRecord
	strip_attributes
	belongs_to :meter
	has_many :articles, dependent: :destroy
	has_many :logs, dependent: :destroy
	validates :meter_id, presence: true
	validates :description, presence: true
	validates :status, presence: true
end