Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'public#home'

  get 'users/profile', as: 'user_root'

  resources :posts
  # get 'posts' => 'posts#index', as: :posts

  resources :users, only: [:new, :create, :edit] do
    resources :posts
  end
end
