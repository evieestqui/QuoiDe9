Rails.application.routes.draw do
  devise_for :restaurant_owners
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users, only: [] do
    member do
      patch :restaurant_mode
      patch :experience_mode
    end
  end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :decline
    end
  end

  get "restaurant_search", to: "restaurants#search"

  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  get "experience_search", to: "experiences#search"

  resources :experiences, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end

  root "restaurants#index"

  get "/dashboard", to: "pages#dashboard"
  get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end
