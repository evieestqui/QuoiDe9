Rails.application.routes.draw do
  devise_for :restaurant_owners
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end

  get "search", to: "restaurants#search"

  get "/dashboard", to: "pages#dashboard"
  get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"

  root "restaurants#index"
end
