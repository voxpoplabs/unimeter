class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
    	t.text :description
    	t.string :name
    	t.string :email
    	t.string :nickname
    end
  end
end
