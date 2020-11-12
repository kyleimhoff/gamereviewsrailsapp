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
            redirect_to new_game_path
        end
    end

    def index 
        @games = Games.all 
    end

    def show 
        @game = Game.find(params[:id])
    end

    def edit
        @game = Game.find(params[:id])
        @game.update(game_params)
    end

    def destroy 

    end

    private 

    def game_params 
        params.require(:game).permit(:name, :esrb_rating, :description)
    end
end