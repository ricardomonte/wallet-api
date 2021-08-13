Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/sign_up', to: "registrations#create"
      post '/sign_in', to: "sessions#create"
      delete '/sign_out', to: "sessions#destroy"
      resources :accounts, only: [:index]
      resources :transactions, only: [:index, :create]
    end
  end
end
