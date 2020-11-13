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

    def facebook
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.username = auth['info']['name']
            u.password = SecureRandom.hex
        end
        sessions[:user_id] = @user.id
        render '/'
        
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private 

    def auth 
        request.env['omniauth.auth']
    end
end