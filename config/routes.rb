Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "api/v1/movies#index"

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index] do
        resources :seasons, only: [:index]
      end
      resources :orders, only: [:create]
    end
  end
end
