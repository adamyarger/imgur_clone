class AddImageUrlHtmlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_url_html, :text
  end
end
