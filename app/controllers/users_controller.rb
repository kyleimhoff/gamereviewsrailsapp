class UsersController < ApplicationController
    def new 
        @user = User.new
    end
    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_user_path
        end
    end 

    def index
        redirect_if_not_logged_in
        @users = User.all
    end

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
    end

    def update 
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        @user.update(user_params)
    end

    def destroy
        redirect_if_not_logged_in
    end

    private 

    def user_params 
        params.require(:user).permit(:username, :password)
    end
end