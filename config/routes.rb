Rails.application.routes.draw do
  devise_for :restaurant_owners
  devise_for :users

  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create]
    get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end

  resources :bookings, only: [] do
    member do
      patch :accept
      patch :decline
      get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end
    get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end

  get "search", to: "restaurants#search"

  get "/dashboard", to: "pages#dashboard"

  root "restaurants#index"
  get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end
