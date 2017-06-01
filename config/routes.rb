Rails.application.routes.draw do
  get 'movies/index'

  devise_for :users

  resources :users

  resources :movies

  root 'movies#index'
end
