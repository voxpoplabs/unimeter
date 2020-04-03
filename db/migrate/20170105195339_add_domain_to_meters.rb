class AddDomainToMeters < ActiveRecord::Migration[5.0]
  def change
    add_column :meters, :domain, :string
  end
end