Rails.application.routes.draw do
  root to: 'home#view'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
