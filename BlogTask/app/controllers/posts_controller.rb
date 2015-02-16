class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post_params = post_params
		#@post_params[:user_id] = 1 #session[:user_id]
		@post = Post.new(@post_params)
		if @post.save
			# @cat = get_categories
			# @cat.each do |c|
			# 	Categoryofpost.create(post_id: @post.id, category_id: c)
			# end
			flash[:notice] = "The post has been posted successfully."
		else
			flash[:alert] = "The post has not been posted."
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

  protected
	def post_params
		params.require(:post).permit(:title, :body)
	end
	def get_categories
		params.require(:post).permit(:related_categories)
	end
end