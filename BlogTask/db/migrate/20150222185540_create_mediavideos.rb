class CreateMediavideos < ActiveRecord::Migration
  def change
    create_table :mediavideos do |t|
      t.string :youtube_id
      t.belongs_to :post

      t.timestamps null: false
    end
  end
end
