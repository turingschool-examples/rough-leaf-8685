Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios', to: 'studios#index'

  get "/movie/:movie_id", to: 'movies#show'
  post "/movie/:movie_id", to: 'actors#create'

  get "/actor_movie/new", to: 'actor_movie#create'
end
