class AddCommentRefToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :comment, index: true
    add_foreign_key :replies, :comments
  end
end
