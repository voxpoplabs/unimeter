class Article < ApplicationRecord
	strip_attributes
	belongs_to :promise
	validates :promise_id, presence: true
	validates :article_status, presence: true
	validates :title, presence: true
	default_scope -> {order(date: :desc)}
end