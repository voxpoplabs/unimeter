class CreateBlogposts < ActiveRecord::Migration[5.0]
	def change
		create_table :blogposts do |t|
			t.string :title
			t.text :content
			t.references :meter, foreign_key: true
			t.references :user, foreign_key: true
			t.timestamps
		end
	end
end