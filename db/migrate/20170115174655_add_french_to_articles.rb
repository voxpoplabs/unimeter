class AddFrenchToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :note_fr, :text
  	add_column :articles, :article_date_fr, :date
  	add_column :articles, :url_fr, :string
  	add_column :articles, :link_name_fr, :text
  	add_column :articles, :paragraph1_fr, :text
  	add_column :articles, :paragraph2_fr, :text
  	add_column :articles, :paragraph3_fr, :text
  	add_column :articles, :title_fr, :text
  	     
  end
end
