Rails.application.routes.draw do
  devise_for :users
  # root 'tickets#select_trip'
  root 'home#index'

  resources :routes, :buses, :trips, :tickets, :users

  get 'profile', to: 'users#profile'

  get 'select_trip', to: 'tickets#select_trip'
  get 'select_seat/:id', to: 'tickets#select_seat', as: "select_seat"
  post 'payment/:id', to: 'tickets#payment', as: 'payment'
  get 'show_payment', to: 'tickets#show_payment'
  post 'confirm_order', to: 'tickets#confirm_order'
end
