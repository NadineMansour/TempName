class UsersController < ApplicationController
	
	def change_name
		User.update(current_user.id, name: params[:n])
		redirect_to user_path(current_user)
	end

	def request_auth
		User.update(current_user.id, request: true)
		redirect_to user_path(current_user)
	end

	def add_info
		@user = current_user
	end	

	def change_signature
		User.update(current_user.id, signature: params[:sig])
		redirect_to user_path(current_user)
	end

	def change_info
		User.update(current_user.id, information: params[:info])
		redirect_to user_path(current_user)
	end

	def edit_info
		@user = current_user
	end


	def edit_display_picture
		@user = current_user
		if params[:image].present?
			@user.profileImage = params[:image]
		elsif params[:image_url].present?
			@user.remote_profileImage_url = params[:image_url]
		else 
			flash[:error] = " No image uploaded "
			redirect_to :back
			return
		end

		if @user.save
			flash[:notice] = "Successfully changed profile picture."
			redirect_to @user
		else 
			flash[:error] = "Something went wrong!"
			puts "***********"
			redirect_to :back
		end 	
	end

	def index
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
		@posts = Post.where(user_id: @user.id)
		@post_attachment = @post.post_attachments.build
	end

	def new
		 @user = User.new
    end

    def create
    @user = User.new(user_params)    # Not the final implementation!
   	if @user.save
   		flash[:success] = "Welcome to the Game!"
    		redirect_to @user
    else
      render 'new'
    end
	end
	
	private
	def user_params
      params.require(:user).permit(:username, :name, :password)
  	end

 end