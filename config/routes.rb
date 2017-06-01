Rails.application.routes.draw do
  get 'new/genre'

  devise_for :users

  # resources :genres
  resources :tips
  root 'index#index'

  get '/genres/:genre', to: 'genres#show', as: 'genre'

  get '/users/', to: 'users#index', as: 'users'
  get '/users/:user_id', to: 'users#show', as: 'user'
  get '/users/:user_id/tips/new', to: 'usertips#new', as: 'new_user_tip'
  post '/users/:user_id/tips', to: 'usertips#create', as: 'create_user_tip'
  get '/users/:user_id/tips/:id', to: 'usertips#show', as: 'user_tip'
  get '/users/:user_id/tips/:id/edit', to: 'usertips#edit', as: 'edit_user_tip'
  patch '/users/:user_id/tips/:id', to: 'usertips#update', as: 'update_user_tip'
  delete '/users/:user_id/tips/:id', to: 'usertips#destroy', as: 'delete_user_tip'

  # route to redirect users to root if they enter invalid URL?

end
