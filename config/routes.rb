Rails.application.routes.draw do

  get "product", to: "product#index", as: "products_index"
  get "product/:id", to: "product#show", as: "product"
  get "product/:id/addtocart", to: "product#addToCart", as: "addtocart"

  # get "customers/:id", to: "customers#show", as: "customer"
  resources :customers, only: [:new, :create, :show]

  get "pages/login", to: "pages#login", as: "login"
  post "pages/login_check", to: "pages#login_check", as: "login_check"
  get "pages/logout", to: "pages#logout", as: "logout"
  get "pages/register", to: "pages#register", as: "register"
  get "pages/cart", to: "pages#cart", as: "cart"
  delete "pages/cart", to: "pages#removeFromCart", as: "remove"
  get "pages/invoice", to: "pages#invoice", as: "invoice"
  get "pages/about"
  get "pages/contact"


resources :products
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
   root "product#index"
end
