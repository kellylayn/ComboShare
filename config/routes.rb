Rails.application.routes.draw do
  #ゲストログイン機能
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'end_users/sessions#guest_sign_in'
  end

  #管理者ログイン機能
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  #利用者ログイン機能
  devise_for :end_users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


  #利用者側ルーティング
  scope module: :public do
    root to: 'homes#top'
    get '/homes/about' => 'homes#about', as: 'about'
    get '/homes/privacy_policy' => 'homes#privacy_policy', as: 'privacy_policy'
    get "/search" => "searches#search"
    get "/favorites/index" => "favorites#index"
    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :article_comments, only: [:create, :destroy]
    end
    resources :end_users, only: [:show, :edit, :index, :update]
  end


  #管理者側ルーティング
  namespace :admin do
    root to: 'end_users#index'
    resources :end_users, only: [:edit, :destroy]
    resources :articles, only: [:index, :show, :destroy]
  end
end