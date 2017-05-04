class Api::V1::SpotsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    render json: Spot.all
  end

  def show
    render json: Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
    if @spot.save
      flash[:notice] = "Great Work a new Spot was added."
      redirect_to spots_path(@spot)
    else
      flash[:notice] = "Oops, lets try that again"
      redirect_to new_spot_path
    end
  end

  private

  def spot_params
    params.require(:spot).permit(
      :id,
      :name,
      :coordinates,
      :description
    )
  end
end
