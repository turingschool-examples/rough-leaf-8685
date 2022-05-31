Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/studios", to: "studios#index"

  get "/movies/:movie_id", to: "movies#show"

  get "/actors/:actor_id", to: "actors#show"

  post "/movies/:movie_id/actors", to: "actor_movies#create"
end
