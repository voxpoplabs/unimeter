class AddProvinceToMeters < ActiveRecord::Migration[5.0]
	def change
		add_column :meters, :province, :string
	end
end