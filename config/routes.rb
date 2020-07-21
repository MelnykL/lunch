Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :menu_items do
    member do
      post :add_to_cart
    end
  end

  resources :carts, only: [:index, :destroy] do
    member do
      post :confirm
    end
  end
  
  resources :users, only: [:index, :destroy]
  resources :orders

  namespace :api do
    namespace :v1 do
      resources :orders
    end
  end
end
