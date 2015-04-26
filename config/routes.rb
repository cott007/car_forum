Rails.application.routes.draw do

  # Home Page
  root 'posts#index'

  # Routes to set up a new user
  get "users" => "users#index" 
  get "users/:id" => "users#show", as: :user
  get "signup" => "users#new"
  post "users" => "users#create"
  get "users/:id/edit" => "users#edit", as: :edit_user
  patch "users/:id" => "users#update" 

  # Routes for logging in and out
  get "login" => "sessions#new" 
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  # index of all the posts and home page
  get 'posts/' => 'posts#index'
  # page to make a new post connected to new controller action
  get 'posts/new' => 'posts#new', as: :new_post
  # showing the singular post based on id attribute
  get 'posts/:id' => 'posts#show', as: :post
  # posts to the data base and calls the post create controller action
  post 'posts/' => 'posts#create'
  # gets a post by id and calls the edit controller
  get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  # puts in the new information on the database based on id
  patch 'posts/:id' => 'posts#update'
  # uses the delete controller for the a post based on id
  delete 'posts/:id' => 'posts#destroy'

  # Routes for comments
  # Make a comment
  post 'post/:id/comments' => 'comments#create', as: :post_comments
  # Delete a comment
  delete 'comments/:id' => 'comments#destroy', as: :delete_comment

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
