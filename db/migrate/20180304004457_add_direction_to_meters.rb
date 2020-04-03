class AddDirectionToMeters < ActiveRecord::Migration[5.1]
	def change
		add_column :meters, :direction, :boolean
		add_column :meters, :direction_b, :boolean
	end
end