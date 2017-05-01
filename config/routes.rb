Rails.application.routes.draw do
  devise_for :users
  resources :spots, only: [:index, :show, :create, :new, :edit, :update, :destroy] 

  resources :users, only: [:index, :show, :destroy]

end
