class Api::GamesController < ApplicationController

  before_action :get_game, only: [:update, :destroy]
  
  def index
    render json: Game.order(:created_at)
  end

  def create
    game = Game.new(game_params)
    if game.save
      render json: game 
    else
      render_error(game)
    end
  end

  def update
    if @game.update(game_params)
      render json: @game
    else
      render_error(@game)
    end
  end

  def destroy
    @game.destroy
  end

  private
    def game_params 
      params.require(:game).permit(:home_team, :away_team, :stadium, :site)
    end

    def get_game
      @game = Game.find(params[:id])
    end

    def render_error
      errors = game.errors.full_messages.join(",")
      render json: {errors: errors}, status: 418
    end

end
