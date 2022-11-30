# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :user_info
  get 'search', to: 'search#index'
  resources :categories
  resources :properties do
    resources :queries
  end
  root to: 'properties#index'
  resources :users, only: [:show]
end
