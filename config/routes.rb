Rails.application.routes.draw do

get "/studios", to: 'studios#index'

get "movies/:movie_id", to: 'movies#show'
end
