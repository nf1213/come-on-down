Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  namespace :admin do
    resources :prizes, only: [:new, :create, :update]
  end
end
