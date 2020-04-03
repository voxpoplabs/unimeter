class AddGoogleAnalyticsCodeToMeter < ActiveRecord::Migration[5.1]
  def change
    add_column :meters, :google_analytics_code, :string
  end
end
