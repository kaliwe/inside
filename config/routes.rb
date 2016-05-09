Rails.application.routes.draw do
  root to: 'home#view'

  get 'users/new'
  post 'users/create', to: 'users#create'

  get 'posts/new'
  post 'posts/create', to: 'posts#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
