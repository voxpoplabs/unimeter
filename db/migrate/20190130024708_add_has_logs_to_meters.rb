class AddHasLogsToMeters < ActiveRecord::Migration[5.2]
	def change
		add_column :meters, :has_logs, :boolean
	end
end