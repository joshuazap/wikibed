Rails.application.routes.draw do
  devise_for :users

  resources :charges
  resources :subscribers
  resources :users
  resources :wikis

  root 'wikis#index'
end
