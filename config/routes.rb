Rails.application.routes.draw do
  get 'alter_password/index'
  resources :tags
  root "articles#index"

  resources :articles do
    resources :comments
  end

  get '/register', to: 'login#index'
  post '/register', to: 'login#create'


  get '/login', to: 'login#index'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#destroy'


  resources :password_resets, param: :reset_password_token, only: [:index, :create, :edit, :update]
  resources :user

  resources :uploads, only: [:new, :create]

  get 'alterar_senha', to: 'alter_password#edit_password', as: 'edit_password'
  patch 'alterar_senha', to: 'alter_password#update_password', as: 'update_password'

end
