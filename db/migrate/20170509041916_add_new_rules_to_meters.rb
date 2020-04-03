class AddNewRulesToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :rules, :text
		add_column :meters, :rules_fr, :text
	end
end