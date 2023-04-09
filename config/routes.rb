Rails.application.routes.draw do
  # get 'users/index'
  root 'home#index'
  
  resources :users
end
