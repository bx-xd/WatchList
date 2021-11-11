Rails.application.routes.draw do
  root 'lists#index'
  resources :lists, only: [:index, :show, :new, :create]
  resources :bookmarks, only: [:new, :create, :destroy]
end
