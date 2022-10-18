Rails.application.routes.draw do
  resources :categories
  resources :movies
  get 'home/index'

  root to: "home#index"
  devise_for :users
  resources :users
  
end
