
Rails.application.routes.draw do

  scope "(:locale)", locale: /es|en/ do

    root 'home#index'
    get 'home' => 'home#index'

    get 'about' => 'about#index'

    scope 'about' do
      get 'history' => 'about#history'
      get 'members' => 'about#members'
      get 'member/:id' => 'about#member'
    end

    devise_for :users, :controllers => { registrations: 'registrations', sessions: 'sessions' }

    post 'users/validateUsername/' => 'users#validate_username', :defaults => { :format => 'json' }
    post 'users/validateEmail/' => 'users#validate_email', :defaults => { :format => 'json' }

    scope 'profile' do
      delete 'destroy_avatar', to: 'users#destroy_avatar'
      put 'update_avatar', to: 'users#update_avatar'
      get ':username/editPhoto', to: 'users#edit_profile_photo'
      get ':username', to: 'users#show'
      put ':id', to: 'users#update'
      get ':username/edit', to: 'users#edit'
      get ':username/update_password', to: 'users#edit_password'
      put ':username/update_password', to: 'users#update_password'
    end


    scope "admin" do
      get 'transferRole' => 'users#show_transfer_role'
      post 'transferRole' => 'users#transfer_role'
      put 'users/changeRoles' => 'users#change_roles'
      resources :users, except: [:show, :create] #show is handled in profile, create in registrations
    end
  end

  #get '/:locale' => 'dashboard#index'

  #scope "(:locale)", locale: /en|es/ do
  #  resources :books
  #end

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
