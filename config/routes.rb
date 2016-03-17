Rails.application.routes.draw do
  root 'portal_page#home'

  devise_for :users

  resources :topics do
    resources :posts
  end

  resources :posts do
    resources :comments, shallow: true
    member do
      post 'top' => "posts#top"
      post 'elite' => "posts#elite"
    end
    collection do
      get 'elite' => "posts#elite_posts"
    end
  end

  post "posts/post_pictures" => "posts#pictures"
  post "posts/:id/post_pictures" => "posts#pictures"
  post "post_pictures" => "posts#pictures"

  # get "topic/:topic_id/posts" => "posts#index"

  resources :users, only: [:index, :show]
  get "avatar" => "users#avatar"
  patch "avatar" => "users#update"

  resources :shops do
    resources :foods, shallow: true
    member do
      get "uppics" => "shops#uppics"
      post "uppics" => "shops#upload_picture"
      post "face" => "shops#face"
      post "check" => "shops#check"
    end
    collection do
      get "owner" => "shops#owner"
    end
  end

  get "foods" => "foods#index_all"
  post "foods/:id/check" => "foods#check", as: :check_food
  resources :remarks

  get "category/:category_id/shops" => "shops#index", as: :category_shops

  resources :pictures, only: [:destroy]

  namespace :admin do
    get 'manage/check'
    get 'manage/shops'
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
  #     #     resources :sales do
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
