class Api::V1::ReportsController < ApplicationController

  def index
    render json: Report.all
  end

  def show
    render json: Report.find(params[:id])
  end
end
