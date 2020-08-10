Rails.application.routes.draw do
  get 'search/users', to: 'search#users', as: 'search'
  get '/microposts', to: 'microposts#new'
  devise_for :users
  root 'home#top'
  get 'home/home'
  resources :users
  resources :books, only: [:new, :create, :edit, :update]
  resources :book_registers, only: [:create, :destroy]
  resources :microposts, except: [:index]
end
