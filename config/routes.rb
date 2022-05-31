Rails.application.routes.draw do
  resources :studios, only: [:index]

  resources :movies, only: [:show]

  resources :movie_actors, only: [:create]
end
