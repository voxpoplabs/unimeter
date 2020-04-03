class AddArticleReferenceToLogs < ActiveRecord::Migration[5.1]
	def change
		add_column :logs, :article_reference, :integer
	end
end