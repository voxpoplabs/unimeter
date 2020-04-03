class RenameBilingualSections < ActiveRecord::Migration[5.1]
	def change
		rename_column :meters, :about_b, :b_about
		rename_column :meters, :description_b, :b_description
		rename_column :meters, :direction_b, :b_direction
		rename_column :meters, :rules_b, :b_rules
		rename_column :meters, :text_days_b, :b_text_days
		rename_column :meters, :text_of_b, :b_text_of
		rename_column :meters, :updates_b, :b_updates
	end
end