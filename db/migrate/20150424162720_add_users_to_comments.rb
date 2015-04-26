class AddUsersToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :users, index: true, foreign_key: true
  end
end
