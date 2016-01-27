Rails.application.routes.draw do
  devise_for :users

  resources :charges
  resources :subscribers
  resources :users
  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end

  root 'wikis#index'
end
