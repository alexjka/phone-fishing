class FavoritesController < ApplicationRecord

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
  binding.pry
  @favorite = Favorite.create(favorite_params)
end

private

def favorite_params
  params.require(:favorite).permit(
    :checked?
  )

end

end
