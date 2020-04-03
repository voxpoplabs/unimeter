class CreateArticles < ActiveRecord::Migration[5.0]
	def change
		create_table :articles do |t|
			t.text :title
			t.references :promise, foreign_key: true
			t.date :article_date
			t.string :url
			t.text :link_name
			t.text :paragraph1
			t.text :paragraph2
			t.text :paragraph3
		end
	end
end