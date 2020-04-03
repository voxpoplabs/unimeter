class AddShowDateToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :show_date, :boolean
	end
end