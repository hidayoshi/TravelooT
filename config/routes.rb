# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admins/index'
  get 'users/show'
  devise_for :admins
  devise_for :users
  # , controllers: {
  #   sessions: 'users/sessions',
  #   confirmations: 'users/confirmations',
  # registrations: 'users/registrations'
  #   passwords: 'users/passwords'
  # }
  root 'microposts#index'

  resources :users, only: %i[index show]
  resources :microposts, only: %i[new create destroy]
  resources :likes, only: %i[create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
