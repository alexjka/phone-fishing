Rails.application.routes.draw do
  devise_for :users
  resources :spots, only: [:index, :show, :create, :new, :edit, :update, :destroy] do
    resources :reports
    end

  resources :spots do
    resources :favorites
  end


  resources :users, only: [:index, :show, :destroy]

  namespace :api do
    namespace :v1 do
      resources :spots
    end
  end

  namespace :api do
    namespace :v1 do
      resources :reports
    end
  end

  namespace :apps do
    post '/texting/send_text' => 'texting#send_text'
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

end
