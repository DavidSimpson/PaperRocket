class AddUserIdToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :author_id, :integer
  	add_index :articles, :author_id
  	remove_column :articles, :author
  end
end
