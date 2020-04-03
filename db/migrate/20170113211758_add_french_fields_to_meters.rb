class AddFrenchFieldsToMeters < ActiveRecord::Migration[5.0]
  def change
  	  add_column :meters, :name_fr, :string
      add_column :meters, :description_fr, :text
      add_column :meters, :footer_text_fr, :text
      add_column :meters, :about_fr, :text
      add_column :meters, :credits_fr, :text
      add_column :meters, :updates_fr, :text
      add_column :meters, :rules_fr, :text
  end
end
