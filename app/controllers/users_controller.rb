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
            flash[:error] = @user.errors.full_messages.to_sentence
            redirect_to new_user_path
        end
    end 

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        @reviews = @user.reviews.all
    end

    def edit 
        redirect_if_not_logged_in
        @user = User.find(params[:id])
    end
    
    def update 
        redirect_if_not_logged_in
        @user = User.find(params[:id])
       if @user.update(user_params)
            redirect_to user_path(@user)
       else 
        flash[:error] = @user.errors.full_messages.to_sentence
        #raise error saying changes could not be saved    
        redirect_to edit_user_path
       end
    end

    

    private 

    def user_params 
        params.require(:user).permit(:username, :password)
    end
end