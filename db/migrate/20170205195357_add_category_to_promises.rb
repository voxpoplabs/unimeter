class AddCategoryToPromises < ActiveRecord::Migration[5.0]
	def change
		add_column :promises, :category, :integer
	end
end