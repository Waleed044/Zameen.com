# frozen_string_literal: true

Rails.application.routes.draw do
  resources :queries
  resources :categories
  devise_for :users
  resources :properties
  root to: 'properties#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
