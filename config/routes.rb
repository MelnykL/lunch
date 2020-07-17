Rails.application.routes.draw do
  devise_for :users
  root "dashboard#index"

  resources :menu_items
  
end
