class GamesController < ApplicationController
    def new 
        @game = Game.new
    end

    def create 
        redirect_if_not_logged_in
        @game = Game.new(game_params)
        if @game.save
            redirect_to game_path(@game)
        else
            flash[:error] = @game.errors.full_messages.to_sentence
            redirect_to new_game_path
        end
    end

    def index 
        @games = Game.all.order_by_name
    end

    def show 
        redirect_if_not_logged_in
        @game = Game.find(params[:id])
        @game
    end

    

    private 

    def game_params 
        params.require(:game).permit(:name, :esrb_rating, :description)
    end
end