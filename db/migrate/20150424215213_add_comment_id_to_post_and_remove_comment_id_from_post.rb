class AddCommentIdToPostAndRemoveCommentIdFromPost < ActiveRecord::Migration
  def change
  	remove_column :posts, :comment_id
  	add_column :comments, :post_id, :integer
  end
end
