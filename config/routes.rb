Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  devise_for :users

  resources :bookings, only: %i[index show] do
    resources :messages, only: %i[new create]
    resources :reviews
  end

  resources :messages, only: %i[index show destroy edit update]

  resources :storages do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, only: %i[edit update destroy] do
  end

  get '/bookings/:id/approved', to: 'bookings#approved'
end
