class Api::V1::SpotsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Spot.all
  end

  def show
    render json: Spot.find(params[:id])
  end

  private
end
