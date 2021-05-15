Rails.application.routes.draw do
  devise_for :users
  root to: 'post#index'

  resources :user do
    resources :post, only: [:new, :create, :show, :edit, :destroy, :update]
  end

  resources :post do
    resources :comments
  end
end
