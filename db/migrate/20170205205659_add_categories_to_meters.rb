class AddCategoriesToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :category1, :string
		add_column :meters, :category2, :string
		add_column :meters, :category3, :string
		add_column :meters, :category4, :string
		add_column :meters, :category5, :string
		add_column :meters, :category6, :string
		add_column :meters, :category7, :string
	end
end