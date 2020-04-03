class AddFrenchToPromises < ActiveRecord::Migration[5.0]
  def change
	add_column :promises, :promise_description_fr, :string
	
  end
end
