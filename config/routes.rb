Rails.application.routes.draw do
  
  root to: "home#index"

  devise_for :users
  
  resources :users
  resources :categories
  resources :movies do 
    resources :comments
  end
  
  get 'admin', to: 'admin#index'
  get 'admin/index'
  get 'admin/users'
  get 'admin/movies'
  get 'admin/show_movie'
  get 'admin/show_user/:id', to: 'admin#show_user', as: 'admin_user'
  get 'admin/edit_user/:id', to: 'admin#edit_user', as: 'admin_edit_user'
  put 'admin/update_user/:id', to: 'admin#update_user', as: 'admin_update_user'

  namespace :v2 do 
    get 'admin/users'
    get 'admin/movies'
    get 'admin/show_user/:id', to: 'admin#show_user', as: 'admin_user'
    resources :users
    resources :categories
    resources :movies do 
      resources :comments
    end
    resources :comments
  end

  get 'home/index'
end
