class AddUsersToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :users, index: true, foreign_key: true
  end
end
