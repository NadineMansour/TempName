class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #edited by mariam
  protected
  def auth_user_profile?(profile_id)
  	# I will check the name of the session later
  	# if session[:user_id] == profile_id
  	# 	true
  	# else
  	# 	false
  	# end
  	true
  end
  helper_method :auth_user_profile?
  #end
end
