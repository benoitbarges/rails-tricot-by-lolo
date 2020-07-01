Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :products

  resources :orders, only: [:index, :show, :new, :create] do
    resources :payments, only: :new
  end

  resources :carts, only: [:show, :destroy]

  resources :addresses, only: :create

  resources :order_products, only: [:create, :show, :destroy]
end
