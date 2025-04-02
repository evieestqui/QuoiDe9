Rails.application.routes.draw do
  devise_for :restaurant_owners
  devise_for :users

  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end

  get "search", to: "restaurants#search"

  get "/dashboard", to: "pages#dashboard"

  root "restaurants#index"
end
