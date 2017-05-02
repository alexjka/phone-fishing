class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end
end
