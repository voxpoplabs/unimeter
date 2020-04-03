class AddInfoToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :b_days, :string
		add_column :meters, :country, :string
		add_column :meters, :level, :string
	end
end