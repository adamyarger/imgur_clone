module Features

	def create_post(post_title, image_url, post_content)
		visit 'posts/new'
		fill_in 'Title',		:with => post_title
		#need to write a mock, spy or double for auto_html
		fill_in 'Image Url',:with => image_url
		fill_in 'Content',	:with => post_content
		click_on 'Submit'
	end
end
