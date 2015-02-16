class PostsController < ApplicationController
	def create
		image = Post.image_from_url(params[:image_url])
		@post = Post.create body: params[:body], title: params[:title], image: image
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def new
		@post = Post.new
	end


end
