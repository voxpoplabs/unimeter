class AddDefaultCategoryToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :default_category, :integer
	end
end