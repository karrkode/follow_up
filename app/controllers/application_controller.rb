class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

	def logged_in?
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
  	User.find(session[:user_id])
  end

  def relevant_user?
  	session[:user_id] == params[:id].to_i
  end



	helper_method :logged_in?, :log_in, :current_user, :relevant_user?
end
