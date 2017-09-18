class Api::PlayersController < ApplicationController
  before_action :get_player, only: [:update, :destroy]
  before_action :get_team
  
  def index
    render json: @team.players.order(:number)
  end

  def create
    player = @team.players.new(player_params)
    if player.save
      render json: player 
    else
      render_error(player)
    end
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render_error(@player)
    end
  end

  def destroy
    @player.destroy
  end

  private
    def player_params 
      params.require(:player).permit(:first_name, :last_name, :number, :position, :team)
    end

    def get_team
      @team = Team.find(params[:team_id])
    end

    def get_player
      @player = Team.find(params[:id])
    end

    def render_error
      errors = player.errors.full_messages.join(",")
      render json: {errors: errors}, status: 418
    end
end
