# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'public#home'

  resources :posts

  resources :users, only: %i[new create edit show update] do
    resources :posts

    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: %i[create destroy]

  resources :posts do
    resources :comments, only: %i[create destroy]
  end

  resources :posts do
    resources :grades, only: %i[create destroy index]
  end
end
