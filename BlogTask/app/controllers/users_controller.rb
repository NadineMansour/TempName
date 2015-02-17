class UsersController < ApplicationController

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
			p @user.errors
			redirect_to :back
		end 	
	end

	def index
	end

	def show
		@post = Post.new
		@user = User.find params[:id]
	end
end
