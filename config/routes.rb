Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/rooms/own', to: 'rooms#own'
  get '/users/account', to: 'users#account'
  resources :users
  resources :rooms
  resources :reservations
  
end
