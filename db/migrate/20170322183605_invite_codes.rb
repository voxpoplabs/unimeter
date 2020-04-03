class InviteCodes < ActiveRecord::Migration[5.0]
	def change
		create_table :invite_codes do |t|
			t.string :code
			t.boolean :active
		end
	end
end