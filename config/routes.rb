Rails.application.routes.draw do
  get 'movies/index'

  # Override devise controller to use our custom RegistrationsController
  devise_for :users, :controllers => {registrations: 'registrations'}

    resources :votes
    post "upvote_comment", to: "votes#upvote_comment"


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

  resources :comments do
    resources :votes
    post "upvote", to: "votes#upvote_comment"
  end

end
