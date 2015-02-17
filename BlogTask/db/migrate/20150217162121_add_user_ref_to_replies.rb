class AddUserRefToReplies < ActiveRecord::Migration
  def change
    add_reference :replies, :user, index: true
    add_foreign_key :replies, :users
  end
end
