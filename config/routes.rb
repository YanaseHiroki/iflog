Rails.application.routes.draw do
  get 'users/show'
  devise_for :users

  resources :users, only: [:show]
  resources :plans do
  resources :logs
  end

  root to: 'plans#index'
end
