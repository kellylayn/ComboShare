Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/homes/about' => 'homes#about', as: 'about'
    resources :post,only: [:new,:index,:show,:edit]
  end
end