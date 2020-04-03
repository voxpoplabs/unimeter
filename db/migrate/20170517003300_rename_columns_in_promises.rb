class RenameColumnsInPromises < ActiveRecord::Migration[5.0]
	def change
		rename_column :promises, :promise_description, :description
		rename_column :promises, :promise_description_fr, :description_b
		rename_column :promises, :b_subcategory, :subcategory_b
		rename_column :promises, :source_date_fr, :source_date_b
		rename_column :promises, :source_link_name_fr, :source_link_name_b
		rename_column :promises, :source_link, :source_link_url
		rename_column :promises, :source_link_fr, :source_link_url_b
		rename_column :promises, :source_section_fr, :source_section_b
	end
end