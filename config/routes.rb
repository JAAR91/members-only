Rails.application.routes.draw do
  devise_for :users
  root to: 'post#index'

  resources :user do
    resources :post
  end

  resources :post do
    resources :comment
  end
end
