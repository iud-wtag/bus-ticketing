Rails.application.routes.draw do
  root 'home#index'

  resources :routes, :buses
end
