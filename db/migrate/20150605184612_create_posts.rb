class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image_url
      t.text :content
      t.integer :user_id, index: true

      t.timestamps null: false
    end
  end
end
