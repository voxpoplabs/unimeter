class RemoveStatusFromArticles < ActiveRecord::Migration[5.0]
	def change
		remove_column :articles, :status
	end
end