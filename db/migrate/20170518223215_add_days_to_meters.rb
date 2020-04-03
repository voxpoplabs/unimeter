class AddDaysToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :text_days, :string
		add_column :meters, :text_of, :string
		rename_column :meters, :b_days, :text_days_b
		rename_column :meters, :b_of, :text_of_b
	end
end