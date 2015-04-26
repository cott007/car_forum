class RenameColumnCommentsBodyDescription < ActiveRecord::Migration
  def change
  	rename_column :comments, :body, :description
  end
end
