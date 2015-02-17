class AddCommentIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :commentId, :int
  end
end
