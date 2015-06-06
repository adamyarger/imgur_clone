class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			flash[:success] = 'Post Success!'
			redirect_to root_path
		else
			flash[:error] = 'Something went wrong'
			render :new
		end
	end

	def index
		@posts = Post.all
	end

	private

		def post_params
			params.require(:post).permit(:title, :image_url, :content)
		end
end
