Rails.application.routes.draw do
  root "articles#index"

  resources :articles


  get '/register', to: 'register#index'
  post '/register', to: 'register#create'

  get '/login', to: 'login#index'
  post '/login', to: 'login#create'
  
end