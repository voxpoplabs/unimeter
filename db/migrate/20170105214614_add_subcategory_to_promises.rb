class AddSubcategoryToPromises < ActiveRecord::Migration[5.0]
  def change
    add_column :promises, :subcategory, :string
  end
end
