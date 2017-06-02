Rails.application.routes.draw do
  get 'movies/index'

  # Override devise controller to use our custom RegistrationsController
  devise_for :users, :controllers => {registrations: 'registrations'}
<<<<<<< HEAD

    resources :votes
    post "upvote_comment", to: "votes#upvote_comment"

=======
  resources :users
>>>>>>> a92ef2da92841482111699bd6fdf3d0008518a45

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
