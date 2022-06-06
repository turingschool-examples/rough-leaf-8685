Rails.application.routes.draw do

  resources :studios, only: [:index]

  resources :movies, only: [:show, :new]

  resources :actors, only: [:show]

  post "/actor_movies/new", to: "actor_movies#create"
  delete "/actor_movies", to: "actor_movies#destroy"
end
