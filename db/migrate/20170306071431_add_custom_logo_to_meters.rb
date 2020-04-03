class AddCustomLogoToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :logo, :string
		add_column :meters, :b_logo, :string
	end
end