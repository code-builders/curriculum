Rails.application.routes.draw do

  # get "/tasks" # view all of the tasks
  # get "/tasks/:id" # view a specific task
  # get "/tasks/:id" # view a specific task
  # post "/tasks" # Add a task to the database
  # patch "/tasks/:id" # Update a task in the database
  # delete "/tasks/:id" # Delete a task from the database
  # get "/tasks/new", to: "tasks#new"

  # /tasks/10
  # /tasks/30
  # /tasks/blah
  # /tasks/new
  get "/tasks/:id", to: "tasks#show",  as: :show_a_task
  get "/tasks",     to: "tasks#index", as: :tasks
  post "/tasks",    to: "tasks#get_it_done"
  post "/users",    to: "users#create"
  # These two lines do the same thing
  root to: "tasks#index"
  get "/",          to: "tasks#index"

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
