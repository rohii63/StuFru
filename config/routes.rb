Rails.application.routes.draw do
  root 'home#top'
  get 'search/users', to: 'search#users', as: 'user_search'
  get 'search/universities', to: 'search#universities', as: 'university_search'
  get '/microposts', to: 'microposts#new'
  get '/microposts/:id/comments', to: 'microposts#show'
  get '/my_page/:id', to: 'users#my_page', as: 'my_page'

  devise_for :users

  resources :users, only: [:index, :show] do
    member do 
      get :follow end
    resources :books, only: :index
    resources :status_with_books, only: [:edit, :update, :destroy]
    resources :book_categories, only: [:new, :create, :destroy]
    resources :week_targets, except: :show
  end

  patch '/users/:id', to: 'users#update', as: 'user_update'

  resources :microposts, except: [:index, :new] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :books, only: [:create, :show, :update, :destroy]
  resources :book_registers, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
end
