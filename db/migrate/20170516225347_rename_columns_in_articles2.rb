class RenameColumnsInArticles2 < ActiveRecord::Migration[5.0]
	def change
		rename_column :articles, :article_date_fr, :article_date_b
		rename_column :articles, :link_name_fr, :link_name_b
		rename_column :articles, :note_fr, :note_b
		rename_column :articles, :paragraph1_fr, :paragraph1_b
		rename_column :articles, :paragraph2_fr, :paragraph2_b
		rename_column :articles, :paragraph3_fr, :paragraph3_b
		rename_column :articles, :title_fr, :title_b
		rename_column :articles, :url, :link_url
		rename_column :articles, :url_fr, :link_url_b
	end
end