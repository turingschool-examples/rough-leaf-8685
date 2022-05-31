Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/studios', to: 'studios#index'
  resources :studios, only: [:index]
  # get '/movies/:id', to: 'movies#show'
  resources :movies, only: [:show] do 
    resources :actors, controller: 'movie_actors', only: [:create]
  end 
  # post '/movies/:id/actors', to: 'movie_actors#create'
  resources :actors, only: [:show]
end
