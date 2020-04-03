class RemoveUnusedColumnsFromMeters < ActiveRecord::Migration[5.0]
	def change
		remove_column :meters, :content
		remove_column :meters, :name
		remove_column :meters, :primary_color
		remove_column :meters, :footer_text
		remove_column :meters, :twitter_handle
		remove_column :meters, :credits
		remove_column :meters, :rules
		remove_column :meters, :name_fr
		remove_column :meters, :footer_text_fr
		remove_column :meters, :credits_fr
		remove_column :meters, :rules_fr
		add_column :meters, :bilingual, :boolean
		add_column :meters, :b_status1, :string
		add_column :meters, :b_status2, :string
		add_column :meters, :b_status3, :string
		add_column :meters, :b_status4, :string
		add_column :meters, :b_category1, :string
		add_column :meters, :b_category2, :string
		add_column :meters, :b_category3, :string
		add_column :meters, :b_category4, :string
		add_column :meters, :b_category5, :string
		add_column :meters, :b_category6, :string
		add_column :meters, :b_category7, :string
	end
end