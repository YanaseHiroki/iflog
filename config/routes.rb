Rails.application.routes.draw do
  get 'users/show'
  get 'users/rename'
  devise_for :users

  resources :users, only: [:show, :edit, :update]
  resources :plans do
  resources :logs
  end

  root to: 'plans#index'
end
