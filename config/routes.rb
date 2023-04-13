Rails.application.routes.draw do
  root 'home#index'

  resources :users, :routes, :buses, :trips, :tickets
end
