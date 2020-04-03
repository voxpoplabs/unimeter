class AddLanguageToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :b_language, :string
		add_column :promises, :b_subcategory, :string
	end
end