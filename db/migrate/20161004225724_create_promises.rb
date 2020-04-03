class CreatePromises < ActiveRecord::Migration[5.0]
	def change
		create_table :promises do |t|
			t.string :primary_category
			t.string :secondary_category
			t.text :promise_description
			t.string :promise_status
			t.references :meter, foreign_key: true
			t.timestamps
		end
	end
end