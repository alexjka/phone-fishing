Rails.application.routes.draw do
  devise_for :users

  resources :spots, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reports
  end
  # root 'spots#index'

  resources :users, only: [:index, :show, :destroy]

  namespace :api do
    namespace :v1 do
      resources :spots
    end
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
