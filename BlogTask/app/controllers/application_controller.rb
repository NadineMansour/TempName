class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session

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
  
  #edited_by_mariam
  def authenticated_user!
    @user_current = user_current
    if @user_current
      unless @user_current.auth
        redirect_to root_path , alert: 'You are not an authenticated user!'
      end
    else
      redirect_to root_path , alert: 'You have to login first!'
    end
  end

  def user_current
    @user_current ||= User.find(session[:user_id]) if session.key?(:user_id)
  end
  helper_method :user_current

  def user_current?
    user_current.present?
  end
  helper_method :user_current?
  #end mariam

  def after_sign_in_path_for(resource)
  	user_path(current_user)
  end

  def after_sign_up_path_for(resource)
      add_info_user_path
  end

  # def get_requests
  #   User.find_by(request: true)
  # end
  # helper_method :get_requests?

  #end
end
