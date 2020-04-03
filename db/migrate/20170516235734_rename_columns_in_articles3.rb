class RenameColumnsInArticles3 < ActiveRecord::Migration[5.0]
	def change
		rename_column :articles, :article_date, :date
		rename_column :articles, :article_date_b, :date_b
	end
end