Rails.application.routes.draw do
  get 'search/users', to: 'search#users', as: 'search'
  devise_for :users
  root 'home#top'
  get 'home/home'
  resources :users
  resources :books, only: [:new, :create, :edit, :update]
end
