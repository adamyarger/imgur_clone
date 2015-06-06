class Post < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments
	validates :title, :image_url, :presence => true
	
	default_scope -> {order(created_at: :desc)}

	auto_html_for :image_url do
	    html_escape
	    image
	    link :target => "_blank", :rel => "nofollow"
	    simple_format
	end
end
