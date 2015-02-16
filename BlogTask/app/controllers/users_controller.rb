class UsersController < ApplicationController

	def edit_display_picture
		#DUMMY
		@user = User.first #user to be edited, current logged in user.
		if params[:image].present?
			@user.profileImage = params[:image]
		elsif params[:image_url].present?
			@user.remote_profileImage_url = params[:image_url]
		end
		if @user.save
			flash[:notice] = "Successfully changed profile picture."
			redirect_to @user
		else 
			flash[:error] = "Something went wrong!"
			redirect_to :back
		end 	
	end

	def show
		@user = User.find params[:id]
	end
end
