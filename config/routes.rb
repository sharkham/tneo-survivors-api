Rails.application.routes.draw do

  #signup and login routes
  post '/api/v1/login' => "api/v1/sessions#create"
  delete '/api/v1/logout' => "api/v1/sessions#destroy"
  post '/api/v1/signup' => "api/v1/users#create"
  get '/api/v1/get_current_user' => "api/v1/sessions#get_current_user"

  namespace :api do
    namespace :v1 do
      resources :badgetypes
      resources :badges, only: [:index, :show, :destroy]
      resources :novels, only: [:index, :show, :update, :destroy] do
        resources :badges, only: :create
      end
      resources :users do
        resources :novels, only: :create
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
