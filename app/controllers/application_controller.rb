class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login

  def require_login
  	if  session[:user_id] == nil
  		redirect_to controller: "users" , action: "login"
  		flash[:notice] = "You must be logged in to continue"
  	end
  end

end
