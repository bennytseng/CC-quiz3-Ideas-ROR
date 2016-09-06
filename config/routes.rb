Rails.application.routes.draw do

  resources :likes
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :ideas, only: [:new, :create] do
    resources :likes, only: [:create, :destroy]
  end

  root 'ideas#index'
end
