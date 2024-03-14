Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, path: 'mon_profil' do
    resources :avatars, only: [:create]
  end


  resources :static_pages
  resources :products, path:'home'
  resource :cart, only: %i[show destroy], path: 'panier' do
    post 'add/:product_id', to: 'carts#add', as: 'add_to'
  end
  resources :orders, path: 'ma commande'
  resources :cart_products
  root 'products#index'

  scope '/order' do
    post 'create', to: 'orders#create', as: 'create_order'
    get 'success', to: 'orders#success', as: 'sucess_order'
    get 'cancel', to: 'orders#cancel', as: 'cancel_order'
end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
