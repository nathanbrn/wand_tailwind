Rails.application.routes.draw do
  resources :entries
  resources :categories
  resources :users
  resources :about
  root 'dash#index'
end
