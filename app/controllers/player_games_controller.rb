class PlayerGamesController < ApplicationController
  def index

  end

  def new

  end

  def create
    @player_game = PlayerGame.new(player_id: current_player.id, game_id: pg_params[:game_id].to_i)
    if @player_game.save
      redirect_to game_path(Game.find(pg_params[:game_id]))
    else
      flash[:danger] = "Did not save"
      redirect_to game_path(Game.find(pg_params[:game_id]))
    end
  end

  def show

  end

  def edit
  end

  private

  def pg_params
    params.require(:player_game).permit(:game_id)
  end


end
