Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/home'
  resources :users
end
