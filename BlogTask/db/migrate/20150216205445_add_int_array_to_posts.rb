class AddIntArrayToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :cat, :integer, array: true
  end
end
