class Log < ApplicationRecord
	belongs_to :promise
	validates :promise_id, presence: true
	default_scope -> {order(created_at: :desc)}
end