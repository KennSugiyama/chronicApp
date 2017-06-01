Rails.application.routes.draw do
  get 'movies/index'

  devise_for :users
<<<<<<< HEAD

  # resources :users
=======
  resources :users
>>>>>>> e2382fba3272dee805d2e5ea41ce8298dda5eda8

  resources :movies

  get 'search', to: 'movies#search'

  root 'application#index'
  get 'application/index'

  resources :reviews
  resources :comments

  resources :movies do
    resources :reviews do
      resources :comments
    end
  end
end
