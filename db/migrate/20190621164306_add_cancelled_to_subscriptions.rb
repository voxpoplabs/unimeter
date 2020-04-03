class AddCancelledToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :canceled, :boolean
  end
end
