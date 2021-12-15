Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }

  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create] do
      resources :comments, only: %i[new create]
    end
  end
  get 'new', to: 'posts#new'  
  put '/post/:id/like', to: 'likes#create', as: 'like'
end
