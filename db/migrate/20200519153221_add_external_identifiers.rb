class AddExternalIdentifiers < ActiveRecord::Migration[5.2]
  def change
    add_column :promises, :external_identifier, :string
    add_column :articles, :external_identifier, :string
  end
end
