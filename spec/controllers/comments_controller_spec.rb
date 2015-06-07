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

			# it "renders the comment" do
   #      product_response = json_response[:product]
   #      expect(product_response[:title]).to eql @product_attributes[:title]
   #    end

		end
	end
end

# before(:each) do
#     @thing = Factory(:thing)
#     attrs = FactoryGirl.attributes_for(:description, :thing_id => @thing)

#     post :create, :thing_id => @thing, :description => attrs
#   end
