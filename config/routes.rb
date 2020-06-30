Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products

  resources :orders

  resources :carts, only: [:show, :destroy]

  resources :order_products, only: [:create, :show, :destroy] do
    member do
      post :add
      post :reduce
    end
  end
end
