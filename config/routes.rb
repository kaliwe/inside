Rails.application.routes.draw do
  root to: 'home#new'

  get 'home/new'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
