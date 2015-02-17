class AdminsController < ApplicationController

	def authenticated_users
		@authenticated_users = User.authenticated 
	end
	def unauthenticated_users
		@unauthenticated_users = User.unauthenticated 
	end

	#edited by mariam
	def show_requests
		@request_users = User.where(request: true)
	end
#edited by soha
	def accept_request
		@my_user=User.find(params[:user_request])
		@my_user.request=false
		@my_user.auth=true
		if @my_user.save
			render action: :show_requests, notice: "The user can not be authenticated."
		else
			render action: :show_requests, alert: "The user can not be authenticated."
		end

	end

	def reject_request
		@my_user=User.find(params[:user_request])
		@my_user.request=false
		@my_user.auth=false
		if @my_user.save
			render action: :show_requests, notice: "The user can not be authenticated."
		else
			render action: :show_requests, alert: "The user can not be authenticated."
		end

	end
	#end soha 
	#end 
end
