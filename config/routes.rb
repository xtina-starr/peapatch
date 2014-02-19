Peapatch::Application.routes.draw do
  require 'resque/server'
  mount Resque::Server, :at => "/resque"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

  # Twitter auth
  get  'signin',                  to: 'sessions#signin',     as: :signin
  get  "auth/:provider/callback", to: "sessions#create"
  post "auth/:provider/callback", to: "sessions#create"
  get  'signout',                 to: 'sessions#signout',    as: :signout
  post 'profile/update',          to: 'sessions#user_email', as: :update_user_email
  get  'profile',                 to: 'sessions#index',      as: :profile

  # Tools
  get 'tools',           to: 'tools#index',         as: :tools
  post 'tools/checkout', to: 'tools#checkout_tool', as: :checkout 
  post 'tools/checkin',  to: 'tools#checkin_tool',  as: :checkin

  # Posts
  get  'posts/new'    => 'posts#new',     as: :new_post
  post 'posts/create' => 'posts#create',  as: :create_post
  get  'posts'        => 'posts#index',   as: :posts
  get  'posts/:id'    => 'posts#show',    as: :post

  # Comments
  get    'comments/new'        => 'comments#new',     as: :new_comment
  post   'comments/create'     => 'comments#create',  as: :create_comment
  get    'comments'            => 'comments#index',   as: :comments 
  get    'comments/:id'        => 'comments#show',    as: :comment
  delete 'destroy/comment/:id' => 'comments#destroy', as: :destroy_comment

  # Calendar
  get  'calendar' => 'calendars#index',  as: :calendar
  post 'calendar' => 'calendars#create', as: :create_event

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
