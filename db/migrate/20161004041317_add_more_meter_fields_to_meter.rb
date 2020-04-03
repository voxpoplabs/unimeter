class AddMoreMeterFieldsToMeter < ActiveRecord::Migration[5.0]
  def change
      add_column :meters, :individual_name, :string
      add_column :meters, :date_elected, :date
      add_column :meters, :twitter_handle, :string
  end
end
