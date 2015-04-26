class RenameColumnsInCommentsAndPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :users_id, :user_id
  	rename_column :comments, :users_id, :user_id
  end
end
