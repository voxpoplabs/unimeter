class AddCategoryIconsToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :icon_category1, :string
		add_column :meters, :icon_category2, :string
		add_column :meters, :icon_category3, :string
		add_column :meters, :icon_category4, :string
		add_column :meters, :icon_category5, :string
		add_column :meters, :icon_category6, :string
		add_column :meters, :icon_category7, :string
	end
end