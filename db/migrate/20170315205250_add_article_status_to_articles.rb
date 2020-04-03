class AddArticleStatusToArticles < ActiveRecord::Migration[5.0]
	def change
		add_column :articles, :article_status, :integer
		remove_column :promises, :promise_status
	end
end