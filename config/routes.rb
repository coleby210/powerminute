Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'users/registrations',
        omniauth_callbacks: "users/omniauth_callbacks"
      }

  get 'favorite/index'
  get "users/:id", to: "users#show", as: "profile"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get "/top_performers", to: "users#top_users"
  get "/users/:id/7", to: "users#get_7"
  get "/users/:id/31", to: "users#get_31"
  get "/users/:id/all_time", to: "users#get_all_time"
  get "/schedule", to: "users#schedule"
  get "/user_log", to: "users#log"

  put "/users/:id/schedule/day/:day_id", to: "days#update"
  patch "/groupsadmin", to: "groups#update_admin"

  post 'twilio/voice' => 'twilio#voice'
  post 'notifications/notify' => 'notifications#notify'

  resources :categories
  resources :workout_templates
  resources :workouts
  resources :users do
    resources :favorites
  end
  resources :groups
  resources :groups_user
  resources :group_comments

  root "categories#index"

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
