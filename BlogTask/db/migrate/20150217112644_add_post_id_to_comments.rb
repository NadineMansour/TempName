class AddPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :postId, :int
  end
end
