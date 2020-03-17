class PlayersController < ApplicationController
    before_action :set_player, only: [:edit, :update, :show, :destroy]

    def index
        @players = Player.all
    end

    def new
        @player = Player.new
    end

    def create
        @player = Player.new(player_params)

        if @player.save
            redirect_to players_path
        else
            flash[:errors] = @player.errors.full_messages
            redirect_to new_player_path
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @player.destroy
        redirect_to players_path 
    end

    def update
        if @player.update(player_params)
            redirect_to players_path
        else
            flash[:errors] = @player.errors.full_messages
            redirect_to edit_player_path(@player)
        end
    end
    

   private
    def player_params
        params.require(:player).permit(:first_name, :last_name)
    end

    def set_player
        @player = Player.find(params[:id])
    end
end
