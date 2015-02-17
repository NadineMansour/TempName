class AddUserIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :userId, :int
  end
end
