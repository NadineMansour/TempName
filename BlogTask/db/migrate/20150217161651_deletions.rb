class Deletions < ActiveRecord::Migration
  def change
  	remove_column :posts, :userId
  	remove_column :comments, :userId
  	remove_column :comments, :postId
  	remove_column :replies, :commentId
   	remove_column :replies, :userId
  end
end
