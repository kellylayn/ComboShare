Rails.application.routes.draw do

  scope module: :public do
    devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }
    root to: 'homes#top'
    get '/homes/about' => 'homes#about', as: 'about'
    resources :articles, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end


  namespace :admin do
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
    }
    root to: 'homes#top'
  end
end


##元
  # devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  # sessions: "admin/sessions"
  # }

  # devise_for :end_users,skip: [:passwords], controllers: {
  # registrations: "public/registrations",
  # sessions: 'public/sessions'
  # }

  # namespace :admin do
  #   root to: 'homes#top'
  # end

  # scope module: :public do
  #   root to: 'homes#top'
  #   get '/homes/about' => 'homes#about', as: 'about'
  #   resources :post,only: [:new,:index,:show,:edit]
  # end