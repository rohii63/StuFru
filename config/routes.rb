Rails.application.routes.draw do
  get 'search/users', to: 'search#users', as: 'search'
  get '/microposts', to: 'microposts#new'
  get 'home/home', to: 'home#home', as: 'home'
  devise_for :users
  root 'home#top'
  resources :users
  resources :books, only: [:new, :create, :edit, :update]
  resources :book_registers, only: [:create, :destroy]
  resources :microposts, except: [:index]
end
