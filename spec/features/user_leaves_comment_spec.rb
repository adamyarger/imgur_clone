require 'rails_helper'

feature 'user leaves a comment' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		create_post('first post', 'http://imgur.com/', 'cool post')
		click_on('first post')

		fill_in 'Comment', :with => 'first comment'
		click_on('Post')

		expect(page).to have_content 'first post'
	end
end