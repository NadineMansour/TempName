class AdminsController < ApplicationController
	def authenticated_users
		@authenticated_users = user.authenticated 
	end

	#edited by mariam
	def show_requests
		@request_users = User.where(request: true)
	end

	def accept_request
	end

	def reject_request
	end
	#end
end
