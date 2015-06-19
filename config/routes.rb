Rails.application.routes.draw do

  devise_for :users

  # navigation as a given user
  resources :users do
    # following line to be confirmed by David and on David's machine
    # resources :photos, only: [:new, :create] # => not used anymore
    # the following line is an owner route, not a regular user path
    resources :accomodations do #, except: [:show] do
      resources :photos, only: [:new, :create]
      resources :bookings, only: [:edit, :index]
    end
  end

  resources :bookings, only: [:edit, :update, :destroy]

  # anonymous navigation
  resources :accomodations, only: [:index, :show, :new, :update, :edit] do
    resources :bookings, only: [:new, :index, :create]
    # TO DO: TO BE CONFIRMED ON DAVID'S MACHINE
    resources :photos, only: [:new, :create]
    resources :flat_reviews, only: [:new, :create]
  end

  resources :photos, only: [:destroy] # DO NOT CHANGE THIS ROUTE

  # TO DO: TO BE CONFIRMED ON DAVID'S MACHINE
  # resources :accomodations do
  #   resources :photos, only: [:new, :create]
  # end

  # root 'static_pages#home'
  root 'welcome#index'

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
