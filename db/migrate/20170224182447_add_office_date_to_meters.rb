class AddOfficeDateToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :date_office, :date
	end
end