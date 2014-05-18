Torchupdate::Application.routes.draw do

  get "contest/:contest" => "contest#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "vote/article/:id" => "vote#show"
  get "vote/article/up/:id" => "vote#up"
  get "vote/article/down/:id" => "vote#down"
  
  get "user/follow/:followed" => "user#follow"
  get "user/unfollow/:id"=> "user#unfollow"
  get "user/follow"
  
  get "counterevidence/add"
  get "counterevidence/vote"
  
  get "article/write"
  post "article/write"
  
  get "article/edit/:id" => "article#edit"
  post "article/save/:id" => "article#save"
  
  get "article/destroy/:id"=>"article#destroy"
  
  get "article/show/:id" => "article#show"
  
  get "article/report/:id/:report" => "article#report"
  
  get "user/profile"
  get "user/profile/:id" => "user#profile"
  
  get "user/login"
  post "user/login"
  
  get "user/logout"
  
  get "user/register"
  post "user/register"
  
  
  get "feed/defaultfeed"
  get "feed/user/:id" => "feed#user"
  get "/feed/following"
  get "feed/best"
  get "feed/trending"
  get "feed/newest"
  match '/rss' => 'feed#rss',
      :as => :feed,
      :defaults => { :format => 'atom' },
      via: [:get, :post]
  
  get "home/index"
  get "home/about"
  root  "home#index"
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
