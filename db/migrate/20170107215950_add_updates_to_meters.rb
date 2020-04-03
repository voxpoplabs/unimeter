class AddUpdatesToMeters < ActiveRecord::Migration[5.0]
  def change
  	add_column :meters, :updates, :text
  end
end
