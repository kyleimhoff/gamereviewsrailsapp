class ReviewsController < ApplicationController
    def new
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            @review = Review.new
        else
            flash[:error] = @review.errors.full_messages.to_sentence
            redirect_to games_path
        end
    end
    def create 
        @game = Game.find(params[:review][:game_id])
        @review = current_user.reviews.new(review_params)

        if @review.save 
            redirect_to game_path(@game)
        else 
            flash[:error] = @review.errors.full_messages.to_sentence 
            render :new
        end
    end

    def show 
        @review = Review.find(params[:id])
    end

    def index 
        @reviews = Review.all
    end
    
    def edit 
        redirect_if_not_logged_in
        @review = Review.find(params[:id])
    end

    def update 
        redirect_if_not_logged_in
        @review = Review.find(params[:id])
       if @review.update(review_params)
            redirect_to review_path(@review)
       else 
        flash[:error] = @review.errors.full_messages.to_sentence    
        redirect_to edit_review_path
       end
    end

    def destroy 
        @review = Review.find(params[:id])
        
        if @review.destroy 
            redirect_to games_path 
        else 
            flash[:error] = "Review could not be deleted"
            
            redirect_to review_path(@review)
        end
    end


    private 

    def review_params 
        params.require(:review).permit(:rating, :review, :user_id, :game_id)
    end
end