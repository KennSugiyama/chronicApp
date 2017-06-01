Rails.application.routes.draw do
  get 'movies/index'

  devise_for :users

  resources :users
  resources :movies

  get 'search', to: 'movies#search'

  root 'movies#index'
end
