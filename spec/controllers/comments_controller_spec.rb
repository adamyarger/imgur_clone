require 'rails_helper'

describe CommentsController, type: :controller do
	
	describe 'POST #create' do
		context 'with valid attributes' do
			before(:each) do
				@user = FactoryGirl.create :user
				@post = FactoryGirl.create :post
				sign_in @user
				@comment_attributes = FactoryGirl.attributes_for :comment
			end

			it 'creates the comment' do
				post :create, { user_id: @user.id, post_id: @post, comment: @comment_attributes }
				expect(Comment.count).to eq(1)
			end

			it 'renders the comment' do
				post :create, { user_id: @user.id, post_id: @post, comment: @comment_attributes }
				expect(response).to redirect_to @post
			end
		end

		context 'with invalid attributes' do
			before(:each) do
				@user = FactoryGirl.create :user
				@post = FactoryGirl.create :post
				sign_in @user
				# @comment_attributes = FactoryGirl.attributes_for :comment
				@invalid_comment_attributes = { body: nil }
			end

			it 'does not create the post' do
				post :create, { user_id: @user.id, post_id: @post, comment: @invalid_comment_attributes }
				expect(Comment.count).to eq(0)
			end
		end
	end
end

