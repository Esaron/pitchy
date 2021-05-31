Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :users, param: :email, only: [:show]
  resources :projects, param: :name, only: [:new, :create, :show, :update, :delete] do
    post 'likes/toggle', to: 'likes#toggle'
    post :update, on: :member
    resources :slides, param: :url, only: [:index]
  end
end
