class PostsController < ApplicationController
	
	#to be added later : mariam
	#before_action :authenticate_user!, except: [:index]
	#before_action :authenticated_user!, only: [:new, :create]
	#end mariam

	def index
		if params["search"]
			@search_tags = params["search"]
			@tags = @search_tags.split(',')
			@posts_array = []
			@posts_ids = []
			@tags.each do |tag|
				@category = Category.find_by(name: tag)
				if @category
					@temp_posts = @category.related_posts
					if @temp_posts
						@temp_posts.each do |p|
							unless @posts_ids.include?(p[:id])
								@posts_array << p
								@posts_ids << p[:id]
							end
						end  
					end
				end
			end
			@posts = @posts_array
		else
			@posts = Post.all.order(created_at: :desc)
		end
	end

	def new
		@post = Post.new
		@post_attachment = @post.post_attachments.build
	end

	def create
		@post_params = post_params
		if !(current_user.signature).nil?
			@post_params[:body] = @post_params[:body] + " " + current_user.signature
		end
		@post_params[:user_id] = current_user.id
		@related_categories = params[:search]
		if @related_categories
			@all_categories = @related_categories.split(',')
		end
		@categories = []
		@categories_ids = []
		if @all_categories
			@all_categories.each do |c|
				@temp_category = Category.find_by(name: c)
				if @temp_category 
					unless @categories_ids.include?(@temp_category.id)
						@categories_ids << @temp_category.id
						@categories << @temp_category
					end
				else
					@new_category = Category.new
					@new_category.name = c
					@new_category.save
					@categories_ids << @new_category.id
					@categories << @new_category
				end
			end
		end
		@post_params[:categories] = @categories
		@post = Post.new(@post_params)
		respond_to do |format|
			if @post.save
				if (params[:post_attachments])
					params[:post_attachments]['avatar'].each do |a|
		            	@post_attachment = @post.post_attachments.create!(:avatar => a, :post_id => @post.id)
		        	end
	        	end
				format.html { redirect_to user_path(current_user), notice: "The post has been posted successfully."}
				format.js
			else
				#render action: :new, alert: "The post has not been posted."
				format.html { redirect_to user_path(current_user) }
			end
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def show
		@post = Post.find(params[:id])
		#@posted_by = User.find(@post.user_id)
		@comments = Comment.where(post_id: @post.id)
	end


  protected
	def post_params
		params.require(:post).permit(:title, :body, post_attachments_attributes: [:id, :post_id, :avatar])
	end
end

