class AddUserIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :userId, :int
  end
end
