class AddStatusToPromises < ActiveRecord::Migration[5.0]
	def change
		add_column :promises, :status, :integer
	end
end