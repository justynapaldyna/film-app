Rails.application.routes.draw do
  
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/index'
    get 'admin/users'
    get 'admin/movies'
    get 'admin/show_movie'
    get 'admin/show_user'
    get 'admin/edit_user'
  end
  
  resources :categories
  resources :movies
  get 'home/index'

  root to: "home#index"
  devise_for :users
  resources :users

end
