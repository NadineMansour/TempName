Rails.application.routes.draw do
  devise_for :users
get 'signup'  => 'users#new'

  resources :post_attachments

  #edited by mariam
  #add posts resources
  resources :posts
  resources :categories
  resources :comments
  resources :replys
  resources :users do
    member do
      post :edit_display_picture
	    post :add_info
      post :change_signature
      post :change_info
      post :change_name
      post :request_auth
    end
  end


  get '/admin/show_requests', to: 'admins#show_requests'
  get '/admin/accept_request', to: 'admins#accept_request'
  get '/admin/reject_request', to: 'admins#reject_request'
  get '/user/edit_info', to:'users#edit_info'
  get '/Profiles/NadineProfile' , to:'profiles#NadineProfile'
 get '/Profiles/SohaProfile' , to:'profiles#SohaProfile'
 get '/Profiles/MariamProfile' , to:'profiles#MariamProfile'

  get '/Profiles/BadrProfile' , to:'profiles#BadrProfile'
  get '/Profiles/MeloukProfile' , to:'profiles#MeloukProfile'
  get '/Profiles/OufaProfile' , to:'profiles#OufaProfile'
  get '/Profiles/AliProfile' , to:'profiles#AliProfile'
  get '/homepages/home' , to:'homepages#home'
  get '/admins/login', to: 'admins#login'
  post '/admins/login', to:'admins#signin'
  # end mariam
  resources :admins do
    collection do
      get 'authenticated_users'
      get'unauthenticated_users'
      get 'show_requests'
    end
  end

  root 'homepages#home'


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
