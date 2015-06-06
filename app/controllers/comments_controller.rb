class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.current_user.comments.build(comment_params)

		if @comment.save
			flash[:success] = 'Comment Posted'
			redirect_to :controller=>'posts',:action=>'show'
		else
			flash[:error] = 'Something Went Wrong'
			render :new
		end
	end

	private

		def comment_params
			params.require(:comment).permit(:post_id, :body, :user_id)
		end
end
