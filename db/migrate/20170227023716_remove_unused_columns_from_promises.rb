class RemoveUnusedColumnsFromPromises < ActiveRecord::Migration[5.0]
	def change
		remove_column :promises, :primary_category
		remove_column :promises, :secondary_category
		add_column :meters, :b_of, :string
	end
end