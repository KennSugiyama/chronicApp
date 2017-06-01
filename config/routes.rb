Rails.application.routes.draw do
  get 'movies/index'

  devise_for :users

  resources :users

  resources :movies

  get 'search', to: 'movies#search'

  root 'application#index'

  resources :reviews
  resources :comments

  resources :movies do
    resources :reviews do
      resources :comments
    end
  end
end
