class AddSourceToPromises < ActiveRecord::Migration[5.0]
	def change
		add_column :promises, :source_link, :string
		add_column :promises, :source_link_fr, :string
		add_column :promises, :source_link_name, :string
		add_column :promises, :source_link_name_fr, :string
		add_column :promises, :source_section, :string
		add_column :promises, :source_section_fr, :string
		add_column :promises, :source_date, :date
		add_column :promises, :source_date_fr, :date
	end
end