Rails.application.routes.draw do
  get 'search/users', to: 'search#users', as: 'search'
  devise_for :users
  root 'home#top'
  get 'home/home'
  resources :users do
    resources :books
  end
end
