Rails.application.routes.draw do
  root 'static_pages#home'
  
  devise_for :users
  resources :users

  resources :static_pages
  resources :products
  resource :cart, only: %i[show destroy] do
     post 'add/:product_id', to: 'carts#add', as: 'add_to'
  end

  root to: 'index#products'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
