class RenameDescriptionBInMeters < ActiveRecord::Migration[5.0]
	def change
		rename_column :meters, :description_fr, :description_b
	end
end