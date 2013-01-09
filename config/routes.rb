Rails.application.routes.draw do




  namespace :admin do
    resources :assets
    root to: "posts#index"
    resources :posts
    resources :post_categories, except: [:show]
  end

  resources :posts, only: [:index, :show] do
    resources :comments
  end

  root to: "pages#index"
  get "pages/index"

end
