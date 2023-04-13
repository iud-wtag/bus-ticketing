Rails.application.routes.draw do
  root 'home#index'

  resources :users, :routes, :buses, :trips, :tickets

  get 'select_trip', to: 'tickets#select_trip'
  get 'select_seat/:id', to: 'tickets#select_seat', as: "select_seat"
  post 'payment/23', to: 'tickets#payment', as: 'payment'
end
