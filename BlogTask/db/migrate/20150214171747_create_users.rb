class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :information
      t.string :name
      t.boolean :auth
      t.string :signature
      t.string :profileImage

      t.timestamps null: false
    end
  end
end
