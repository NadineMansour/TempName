class PostsController < ApplicationController
	
	#to be added later : mariam
	#before_action :authenticate_user!, except: [:index]
	#before_action :authenticated_user!, only: [:new, :create]
	#end mariam

	def index
		@post = Post.new
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
		if current_user and current_user.auth
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

			@post_txt = post_params[:body]
			@www_index = @post_txt.index("www.youtube.com/watch?v=")
			@video_ids = []
			if @www_index
				while @www_index > -1 do	
					if @post_txt
						@video_id = @post_txt[@www_index + 24, 11]
					end
					@cut = @www_index + 24 + 11
					if @post_txt
					@total_len = @post_txt.length
					else 
						@total_len = 0
					end
					if @post_txt
						@post_txt = @post_txt[@www_index + 24 + 11, @total_len - @cut -1]
						@video_ids << @video_id
						if @post_txt
							@www_index = @post_txt.index("www.youtube.com/watch?v=")
						else
							@www_index = -1
						end
					end
					unless @www_index
						@www_index = -1
					end
				end
			end



			@post_params[:categories] = @categories
			@post = Post.new(@post_params)
			respond_to do |format|
				if @post.save
					if @video_ids
						@video_ids.each do |v|
							@temp_video = Mediavideo.new
							@temp_video.youtube_id = v
							@temp_video.post_id = @post.id
							@temp_video.save
						end
					end
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
		else
			flash[:error] = "Something went wrong!"
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

