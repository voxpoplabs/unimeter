class AddAboutToMeters < ActiveRecord::Migration[5.0]
  def change
      add_column :meters, :about, :text
      add_column :meters, :credits, :text
      
  end
end
