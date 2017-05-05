Rails.application.routes.draw do
  devise_for :users

  resources :spots, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reports
  end

  resources :users, only: [:index, :show, :destroy]

  namespace :api do
    namespace :v1 do
      resources :spots
    end
  end
  # resources :users

  root 'spots#index'
end
