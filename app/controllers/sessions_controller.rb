class SessionsController < ApplicationController

    def create
        @user = User.find_by_id(params[:id])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path, {notice: 'Welcome back gamer!'}
        else
          redirect_to login_path, {alert: "Your Username or Password was invalid"}
        end
      end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
end