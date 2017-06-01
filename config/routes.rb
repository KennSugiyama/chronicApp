Rails.application.routes.draw do
  devise_for :users

  resources :users
  root to: "users#index"

  resources :reviews
  resources :comments

  resources :movies do
    resources :reviews do
      resources :comments
    end
  end

end
