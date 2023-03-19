Rails.application.routes.draw do

  devise_for :end_users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  root to: 'homes#top'
  resources :articles, only: [:new, :index, :show, :edit]

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }
end
