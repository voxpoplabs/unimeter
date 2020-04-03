class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      	t.string :plan_name
        t.string :plan_description
        t.float :const
        t.string :strip_plan_id
    end
  end
end
