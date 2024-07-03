Rails.application.routes.draw do
  resources :entries
  resources :categories
  resources :about
  root 'dash#index'
end
