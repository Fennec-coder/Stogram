Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'public#home'

  resources :posts

  resources :users, only: [:new, :create, :edit, :show] do
    resources :posts

    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: [:create, :destroy]
end
