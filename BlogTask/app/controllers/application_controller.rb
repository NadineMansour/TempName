class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #edited by mariam
  protected
  def auth_user_profile?(profile_id)
  	#I will check the name of the session later
  	# @user = User.find(profile_id)
  	# if session[:user_id] == profile_id && @user.auth
  	# 	true
  	# else
  	# 	false
  	# end
  	true
  end
  helper_method :auth_user_profile?

  #edited by oufa
  #temp fix delete after devise
  def current_user
    User.first
  end
  helper_method :current_user

  # def get_requests
  #   User.find_by(request: true)
  # end
  # helper_method :get_requests?

  #end
end
