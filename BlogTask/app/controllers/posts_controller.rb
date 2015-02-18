class PostsController < ApplicationController
	
	def index
		@posts = Post.all.order(created_at: :desc)
	end

	def new
		@post = Post.new
		@post_attachment = @post.post_attachments.build
	end

	def create

		@post_params = post_params
		#@post_params[:user_id] = session[:user_id]
		@post = Post.new(@post_params)
		if @post.save
			if (params[:post_attachments])
				params[:post_attachments]['avatar'].each do |a|
	            	@post_attachment = @post.post_attachments.create!(:avatar => a, :post_id => @post.id)
	        	end
        	end
			redirect_to @post, notice: "The post has been posted successfully."
		else
			render action: :new, alert: "The post has not been posted."
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
		params.require(:post).permit(:title, :body, category_ids: [], post_attachments_attributes: [:id, :post_id, :avatar])
	end
end

