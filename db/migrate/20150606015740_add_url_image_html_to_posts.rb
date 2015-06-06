class AddUrlImageHtmlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_url_content, :text
  end
end
