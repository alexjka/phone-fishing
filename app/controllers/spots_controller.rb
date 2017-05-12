class SpotsController < ApplicationController
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def show
    @spot = Spot.find(params[:id])
    @reports = @spot.reports
    @report = Report.new
    @favorite = Favorite.new
  end

  def create
    binding.pry
    @spot = Spot.new(spot_params)
    if @spot.save
      flash[:notice] = "New Spot has been saved successfully."
      redirect_to spot_path(@spot)
    end
  end

  def edit
    @spot = Spot.find(params[:id])
  end

  def destroy
    spot = Spot.find(params[:id])
    destroy_spot(spot)
    flash[:notice] = "This spot has been deleted - this secret will go with you to your grave"
    redirect_to root_path
  end

  def update
    binding.pry
    if params.includes(favorite?)
      current_user.favorites.favorite? == true
    end
  end

  private

  def spot_params
    params.require(:spot).permit(
      :name,
      :description,
      :lat,
      :long,
    )
  end
end
