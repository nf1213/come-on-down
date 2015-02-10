Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :prizes, only: [:index, :show] do
    resources :bids, only: [:new, :create]
  end

  namespace :admin do
    resources :prizes, only: [:new, :create, :update]
  end
end
