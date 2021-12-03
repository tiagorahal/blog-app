Rails.application.routes.draw do
  root 'users#index'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/users/:user/posts', to: 'posts#index'
  get '/users/:user/posts/:id', to: 'posts#show'
end
