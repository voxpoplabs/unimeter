class AddPatreonToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :patreon_key, :string
	end
end