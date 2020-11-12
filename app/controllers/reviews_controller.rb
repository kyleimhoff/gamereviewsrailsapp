class ReviewsController < ApplicationController
    def new
        if params[:game_id] && @game = Game.find_by_id(params[:game_id])
            @review = Review.new
        else
            # render an error saying there is no such game
            redirect_to games_path
        end
    end
    def create 
        @game = Game.find(params[:review][:game_id])
        @review = current_user.reviews.new(review_params)

        if @review.save 
            redirect_to game_path(@game)
        else 
            redirect_to new_user_review_path
        end
    end


    private 

    def review_params 
        params.require(:review).permit(:rating, :review, :user_id, :game_id)
    end
end