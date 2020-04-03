class AddRulesToMeters < ActiveRecord::Migration[5.0]
  def change
      add_column :meters, :rules, :text
  end
end
