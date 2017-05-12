class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @favorite = Favorite.all
  end


  def show

  end

  def new
    binding.pry
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.create(checked?: true, spot_id: params[:spot_id], user: current_user)
    redirect_to spot_path(params[:spot_id])
  end

end
