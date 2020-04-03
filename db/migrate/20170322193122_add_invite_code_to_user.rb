class AddInviteCodeToUser < ActiveRecord::Migration[5.0]
	def change
		add_column :users, :invite_code, :string
	end
end