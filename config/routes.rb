Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # only: [:create, :index, :show, :update, :delete]
  resources :skills do
    resources :bookings, only: [:create, :new]
  end


  resources :bookings, only: [:index] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: [:destroy]
  get "profile", to: "dashboard#profile"
  patch "bookings/:id/accept", to: "bookings#accept"
  patch "bookings/:id/decline", to: "bookings#decline"
end