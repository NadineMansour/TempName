class AddRequestToUser < ActiveRecord::Migration
  def change
    add_column :users, :request, :Boolean
  end
end
