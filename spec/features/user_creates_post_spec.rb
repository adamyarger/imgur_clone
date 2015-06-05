require 'rails_helper'

feature 'user create a new post' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		visit 'posts/new'
		fill_in 'title',		:with => 'first post'
		#need to write a mock, spy or double
		fill_in 'image_url',:with => 'http://imgur.com'
		fill_in 'content',	:with => 'funny image'

		click_on 'Submit'

		expect(page.current_path).to eq root_path

		expect(page).to have_content 'Post Success!'
	end
end