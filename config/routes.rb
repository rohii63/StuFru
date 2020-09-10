Rails.application.routes.draw do
  root 'home#top'
  get 'search/users', to: 'search#users', as: 'search'
  get '/microposts', to: 'microposts#new'
  get '/microposts/:id/comments', to: 'microposts#show'
  get '/my_page/:id', to: 'users#my_page', as: 'my_page'
  devise_for :users
  resources :users, only: [:index, :show, :update] do
    member do
      get :follow
    end
    resources :book_categories, only: [:new, :create, :destroy]
  end
  resources :books, only: [:index, :create, :show, :update, :destroy]
  resources :book_registers, only: [:create, :destroy]
  resources :microposts, except: [:index, :new, :edit] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
end
