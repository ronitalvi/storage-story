Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :users do
  end

  resources :bookings, only: %i[index show] do
    resources :messages
  end


  resources :storages do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[edit update destroy] do
  end
end
