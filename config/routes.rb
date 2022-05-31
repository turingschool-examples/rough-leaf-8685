Rails.application.routes.draw do

get "/studios", to: 'studios#index'

get "/movies/:movie_id", to: 'movies#show'
patch "/movies/:movie_id", to: 'movies#update'
end
