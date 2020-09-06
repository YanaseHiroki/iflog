Rails.application.routes.draw do
  
  devise_for :users
  resources :plans
  # resources :plans do
  #   resources :logs
  # end

  root to: 'plans#index'
  # root to: 'logs#new'
end
