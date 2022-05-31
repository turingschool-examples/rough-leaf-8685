Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :studios, only: [:index]
  resources :movies, only: [:show]  
  post '/movies/:movie_id/actors', to: 'movie_actors#create'
end
