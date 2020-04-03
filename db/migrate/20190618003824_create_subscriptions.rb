class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :stripe_token
      t.references :user, foreign_key: true
      t.timestamps
      t.references :plan, foreign_key: true
      t.string :stripe_customer_id
      t.string :name
    end
  end
end
