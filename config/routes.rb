Rails.application.routes.draw do
  get 'movies/index'

  # Override devise controller to use our custom RegistrationsController
  devise_for :users, :controllers => {registrations: 'registrations'}


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

  resources :comments do
    resources :votes
      post "upvote", to: "votes#upvote_comment"
      post "downvote", to: "votes#downvote_comment"
  end

  resources :reviews do
    resources :votes
      post "upvote", to: "votes#upvote_review"
      post "downvote", to: "votes#downvote_review"
  end

  resources :movies do
    resources :votes
      post "rating", to: "votes#movie_rating"
  end


end
