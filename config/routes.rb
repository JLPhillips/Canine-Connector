CanineConnector::Application.routes.draw do





  get "static/about_page"
  get "static/landing_page"
  get "static/dev_page"
  get "static/privacy_page"
  get "static/help_page"
  get "static/terms_page"
  get "static/cookies_page"
  get "static/home_page"
  # get '/',        to: 'pages#landing'
  # get '/home',    to: 'pages#home'
  # get '/dashboard',    to: 'pages#dashboard'
  # get 'help',    to: 'pages#help'
  # get 'about',   to: 'pages#about'
  # get '/terms'  => 'pages#terms'
  # get 'privacy', to: 'pages#privacy'
  # get 'cookies', to: 'pages#cookies'
  # get 'dev',      to: 'pages#dev'

  # resource :pages, only: [:index] do
  #   member do
  #     get :help
  #     get :about
  #     get :terms
  #     get :privacy
  #     get :cookies
  #     get :dev
  #   end
  # end

  root to: "dogs#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :dogs

  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
