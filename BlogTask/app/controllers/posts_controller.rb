class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
	end

	def edit
	end

	def update
	end

	def destroy
	end

  protected
	def post_params
		#params.require(:post).permit()
	end
end