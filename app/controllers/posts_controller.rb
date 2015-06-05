class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(posts_params)

		if @post.save
			flash[:success] = 'Post Success!'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			render :new
		end
	end
end
