Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/studios/index", to: "studio#index"

  get "/movies/:movie_id", to: "movie#show"
end
