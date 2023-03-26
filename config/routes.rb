Rails.application.routes.draw do

  scope module: :public do
    devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }
    root to: 'homes#top'
    get '/homes/about' => 'homes#about', as: 'about'
    get "/search" => "searches#search"
    get "/favorites/index" => "favorites#index"
    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :article_comments, only: [:create, :destroy]
    end
    resources :end_users, only: [:show, :edit, :index, :update]
  end


  namespace :admin do
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
    }
    root to: 'homes#top'
  end
end