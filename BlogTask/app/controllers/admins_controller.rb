class AdminsController < ApplicationController

	def authenticated_users
		@authenticated_users = User.authenticated 
	end

	def unauthenticated_users
		@unauthenticated_users = User.unauthenticated 
	end

	def show
	 @authenticated_users = User.authenticated 
	 @unauthenticated_users = User.unauthenticated 
	 @request_users = User.where(request: true)
	end

	def login
	end

	def signin
  	if params[:admins][:pass] == "hello"
  		
  		redirect_to '/admins/show'
  	else
  		
  		redirect_to '/admins/login'
  end
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
		@my_user.save
			redirect_to '/admins/show'
		

	end

	def reject_request
		@my_user=User.find(params[:user_request])
		@my_user.request=false
		@my_user.auth=false
		@my_user.save
			redirect_to '/admins/show'

	end
	#end soha 
	#end 
end
