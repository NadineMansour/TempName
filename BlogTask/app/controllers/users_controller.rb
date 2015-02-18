class UsersController < ApplicationController
	
	def add_info
		@user = current_user
	end	

	
	def change_signature
		User.update(params[:id] , signature: params[:sig])
		redirect_to User.find(params[:id])
	end

	def change_info
		User.update(params[:id] , information: params[:info])
		redirect_to User.find(params[:id])
	end


	def edit_display_picture
		
		@user = current_user
		binding.pry
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
			p @user.errors
			redirect_to :back
		end 	
	end

	def index
	end

	def show
		@user = User.find(params[:id])
		@post = Post.new
		#@posts = Post.find(userId: @user.id )
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