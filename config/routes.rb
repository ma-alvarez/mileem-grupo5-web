Rails.application.routes.draw do
  resources :publications
  root :to => "publications#index"
  get '/allpublications', to: 'api#all_publications', via: [:get]
  get '/filterpublications', to: 'api#filter_publications', via: [:get]
  get '/quotation', to: 'api#quotation', via: [:get]
  get '/roomsByZone', to: 'api#rooms_by_zone', via: [:get]
  get '/averageByZone', to: 'api#average_by_zone', via: [:get]
  get '/zoneComparison', to: 'api#zone_comparison', via: [:get]

 devise_for :users, :controllers => { :registrations => 'registrations' } 

  resources :publications do
    member do
      post 'publicate'
    end
  end

  resources :publications do
    member do
      post 'pause'
    end
  end

  resources :publications do
    member do
      post 'unpause'
    end
  end

  resources :publications do
    member do
      post 'pay'
    end
  end

  resources :publications do
    member do
      post 'free_republicate'
    end
  end
  
  resources :publications do
    member do
      post 'retire'
    end
  end

  resources :publications do
    member do
      post 'republicate'
    end
  end

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
