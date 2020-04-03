class AddDescriptionWidthToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :description_width, :int
		rename_column :meters, :about_fr, :about_b
		rename_column :meters, :rules_fr, :rules_b
		rename_column :meters, :updates_fr, :updates_b
	end
end