require 'rails_helper'

feature 'user create a new post' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		create_post('first post', 'http://imgur.com/', 'cool post')

		expect(page.current_path).to eq root_path
		expect(page).to have_content 'Post Success!'
	end
end