class AddMeterTypeToMeters < ActiveRecord::Migration[5.1]
  def change
  	add_column :meters, :meter_type, :string
  end
end
