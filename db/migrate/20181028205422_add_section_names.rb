class AddSectionNames < ActiveRecord::Migration[5.1]
	def change
		add_column :meters, :text_about, :string
		add_column :meters, :text_analytics, :string
		add_column :meters, :text_blog, :string
		add_column :meters, :text_rules, :string
		add_column :meters, :b_text_about, :string
		add_column :meters, :b_text_analytics, :string
		add_column :meters, :b_text_blog, :string
		add_column :meters, :b_text_rules, :string
	end
end