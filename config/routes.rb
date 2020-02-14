# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # , controllers: {
  #   sessions: 'users/sessions',
  #   confirmations: 'users/confirmations',
  #   registrations: 'users/registrations',
  #   passwords: 'users/passwords'
  # }
  root 'microposts#index'

  resources :users, only: [:show]
  resources :microposts, only: %i[new create]
  resources :likes, only: %i[create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
