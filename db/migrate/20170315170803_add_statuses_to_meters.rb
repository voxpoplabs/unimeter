class AddStatusesToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :status1, :string
		add_column :meters, :status2, :string
		add_column :meters, :status3, :string
		add_column :meters, :status4, :string
	end
end