Rails.application.routes.draw do

  get '/api/v1/login' => "sessions#create"

  namespace :api do
    namespace :v1 do
      resources :badgetypes
      resources :badges
      resources :novels
      resources :users
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
