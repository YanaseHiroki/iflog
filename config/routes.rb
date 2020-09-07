Rails.application.routes.draw do
  devise_for :users
    resources :plans do
    resources :logs
  end

  root to: 'plans#index'
end
