class AddUserIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :userId, :int
  end
end
