class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

		if @comment.save
			flash[:success] = 'Comment Posted'
			redirect_to post_path(@post)
		else
			flash[:error] = 'Something Went Wrong'
			render :new
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:body)
		end
end
