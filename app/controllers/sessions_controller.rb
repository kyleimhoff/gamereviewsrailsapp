class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(username: params[:username])
        #raise @user.inspect
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect_to user_path(@user) 
        else
            flash[:message] = "Incorrect login information"
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end