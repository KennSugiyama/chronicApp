Rails.application.routes.draw do
  get 'movies/index'

  devise_for :users
  resources :users

  resources :movies

  get 'search', to: 'movies#search'

  root 'application#index'
  get 'application/index'

  resources :movies do
    resources :reviews
  end

    resources :reviews do
      resources :comments
    end

end
