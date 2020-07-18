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
  
end
