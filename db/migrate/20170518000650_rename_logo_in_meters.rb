class RenameLogoInMeters < ActiveRecord::Migration[5.0]
	def change
		rename_column :meters, :logo, :image_logo
		rename_column :meters, :b_logo, :image_politician
	end
end