Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  
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
      delete 'own', action: 'destroy'
    end
  end

  resources :reservations do
    collection do
      post 'confirm'
      get 'confirm'
    end
  end
end
