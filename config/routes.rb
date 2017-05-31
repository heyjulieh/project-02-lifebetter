Rails.application.routes.draw do
  devise_for :users

  resources :tips

  get '/users/', to: 'users#index', as: 'users'
  get '/users/:user_id', to: 'users#show', as: 'user'

  get '/users/:user_id/tips', to: 'usertips#index', as: 'user_tips'
  get '/users/:user_id/tips/new', to: 'usertips#new', as: 'new_user_tip'
  post '/users/:user_id/tips', to: 'usertips#create'
  get '/users/:user_id/tips/:id', to: 'usertips#show', as: 'user_tip'
  get '/users/:user_id/tips/:id/edit', to: 'usertips#edit', as: 'edit_user_tip'
  patch '/users/:user_id/tips/:id', to: 'usertips#update'
  delete '/users/:user_id/tips/:id', to: 'usertips#destroy'

end
