class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	default_scope -> {order(created_at: :desc)}

	auto_html_for :body do
    html_escape
    image
    youtube(:width => 400, :height => 250, :autoplay => true)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
