Rails.application.routes.draw do
  root :to => "pages#index"

  scope '/admin' do
    devise_for :users, controllers: { sessions: "admin/sessions", passwords: "admin/passwords" }
  end

  namespace :admin do
    root :to => "posts#index"
    resources :users, :except => [:show]
    resources :assets

    resources :posts do
      get :assets, on: :collection
    end

    resources :post_categories, :except => [:show]
    resources :inquiries, :except => [:new, :create, :edit]
  end

  resources :posts, :only => [:index, :show] do
    resources :comments
  end

  resources :inquiries, :only => [:new, :create], :path => "contact"

  match '/home'   => "pages#index",  as: :prices
  match '/prices' => "pages#prices", as: :prices
  match '/tour'   => "pages#tour",   as: :tour

end
