Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  get '/rooms/own', to: 'rooms#own'
  get '/users/account', to: 'users#account'
  get '/users/profile', to: 'users#profile'
  get '/users/profile/edit', to: 'users#profile_edit'
  get '/reservations/confirm', to: 'reserations#confirm'
  resources :users
  resources :rooms
  resources :reservations
  
end
