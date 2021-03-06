class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected 
	def authenticate_user
	  if session[:user_id]
	     # set current user object to @current_user object variable
	    @current_user = User.find session[:user_id] 
	    return true	
	  else
	    redirect_to(:controller => 'sessions', :action => 'login')
	    return false
	  end
	end
	
	def save_login_state
	  if session[:user_id]
	    redirect_to(:controller => 'sessions', :action => 'home')
	    return false
	  else
	    return true
	  end
	end

	protected 
	def authorized_only
puts "controller/action" + params[:controller] + "/" + params[:action]
	  if session[:user_id]
	     # set current user object to @current_user object variable
	    @current_user = User.find session[:user_id] 
	    if @current_user.power_admin
	       	return true
	    elsif @current_user.has_access_to_path(params[:controller] , params[:action], params[:id])
	    	return true
	    else
	    	redirect_to(sessions_profile_path)
	    	return false
	    end
	    return true	
	  else
	    redirect_to(:controller => 'sessions', :action => 'login')
	    return false
	  end
	end
end
