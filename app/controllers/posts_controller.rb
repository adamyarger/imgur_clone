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

	def show
		@post = Post.find(params[:id])
	end

	def upvote
		@post = Post.find(params[:id])

		if @post.save
			@post.upvote_by current_user
			flash[:success] = "Upvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	def downvote
		@post = Post.find(params[:id])

		if @post.save
			@post.downvote_by current_user
			flash[:success] = "Downvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	private

		def post_params
			params.require(:post).permit(:title, :image_url, :content)
		end
end
