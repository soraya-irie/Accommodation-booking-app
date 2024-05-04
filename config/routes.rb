Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
  get '/reservations/confirm', to: 'reservations#confirm'
  resources :users do
    collection do
      get 'account'
      get 'profile'
      get 'profile/edit', to: 'users#profile_edit'
    end
  end

  resources :rooms do
    collection do
      get 'own'
    end
  end

  resources :reservations do
    collection do
      post 'confirm'
    end
  end
end
