Rails.application.routes.draw do
  root 'users#index'
  get '/users/sign_up', to: 'users#sign_up'
  get '/users/sign_in', to: 'users#sign_in'
  resources :users
end
