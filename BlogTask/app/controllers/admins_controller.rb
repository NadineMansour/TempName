class AdminsController < ApplicationController
def authenticated_users
	@authenticated_users = user.authenticated 
end
end
