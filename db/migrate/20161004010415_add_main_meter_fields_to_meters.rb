class AddMainMeterFieldsToMeters < ActiveRecord::Migration[5.0]
  def change
      add_column :meters, :name, :string
      add_column :meters, :subdomain, :string
      add_column :meters, :description, :text
      add_column :meters, :primary_color, :string
      add_column :meters, :facebook_key, :string
      add_column :meters, :twitter_key, :string
      add_column :meters, :disqus_key, :string
      add_column :meters, :footer_text, :text
  end
end
