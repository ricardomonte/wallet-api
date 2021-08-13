Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/sign_up', to: "registrations#create"
      post '/sign_in', to: "sessions#create"
      resources :accounts, only: [:index]
      resources :transactions, only: [:index, :create]
    end
  end
end
