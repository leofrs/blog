Rails.application.routes.draw do
  get 'password_resets/edit'
  get 'password_resets/update'
  root "articles#index"

  resources :articles do
    resources :comments
  end

  get '/register', to: 'register#index'
  post '/register', to: 'register#create'

  get '/login', to: 'login#index'
  post '/login', to: 'login#create'

  resources :password_resets, only: [:index, :create, :edit, :update]

end
