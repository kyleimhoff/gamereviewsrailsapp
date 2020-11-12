class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    private
    def current_user
        if session[:user_id]
        @current_user = User.find(session[:user_id])
        @current_user
        
        else
           false 
        
        end
    end

        def logged_in? 
            !!current_user
        end

        def redirect_if_not_logged_in 
            redirect_to '/' if !logged_in?
        end
end
