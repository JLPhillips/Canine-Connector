CanineConnector::Application.routes.draw do

  # get "static/about_page"
  # get "static/landing_page"
  # get "static/dev_page"
  # get "static/privacy_page"
  # get "static/help_page"
  # get "static/terms_page"
  # get "static/cookies_page"

  # get "/dogs/:id/send"
  # get "/dogs/your_dogs"


  post "/dogs/:id/dog_alert", to: 'dogs#send_dog_alert'

  # get '/',        to: 'static#landing_page'
  # get '/home',    to: 'static#landing_page'
  # match '/',    to: 'static#landing_page', via: "get"
  match '/all_lost',    to: 'dogs#all_lost', via: "get"
  match '/all_found',    to: 'dogs#all_found', via: "get"
  match '/your_dogs',    to: 'dogs#your_dogs', via: "get"
  match '/search',    to: 'dogs#search', via: "get"
  match '/help',    to: 'static#help_page', via: "get"
  match '/about',   to: 'static#about_page', via: "get"
  match '/terms'  => 'static#terms_page', via: "get"
  match '/privacy', to: 'static#privacy_page', via: "get"
  match '/contact', to: 'static#contact_page', via: "get"
  match '/dev',      to: 'static#dev_page', via: "get"

  root to: "dogs#index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # resources :dogs

resources :dogs do
  member do
    get :dog_alert
  end
end


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
