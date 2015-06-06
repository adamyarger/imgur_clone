class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.text :body
      t.text :body_html

      t.timestamps null: false
    end
  end
end
