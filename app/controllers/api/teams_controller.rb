class Api::TeamsController < ApplicationController
  before_action :get_team, only: [:update, :destroy]
  
  def index
    render json: Team.order(:name)
  end

  def create
    team = Team.new(team_params)
    if team.save
      render json: Team.order(:name)
    else
      render_error(team)
    end
  end

  def update
    if @team.update(team_params)
      render json: Team.order(:name)
    else
      render_error(@team)
    end
  end

  def destroy
    @team.destroy
  end

  private
    def team_params 
      params.require(:team).permit(:name, :abbrev)
    end

    def get_team
      @team = Team.find(params[:id])
    end

    def render_error
      errors = team.errors.full_messages.join(",")
      render json: {errors: errors}, status: 418
    end
end
