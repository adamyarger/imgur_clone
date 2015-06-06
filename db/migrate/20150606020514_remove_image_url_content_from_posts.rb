class RemoveImageUrlContentFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :image_url_content, :text
  end
end
