class CreateLogs < ActiveRecord::Migration[5.1]
	def change
		create_table :logs do |t|
			t.string :action
			t.integer :old_status
			t.integer :new_status
			t.references :promise, foreign_key: true
			t.timestamps
		end
	end
end