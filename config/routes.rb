Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios', to: "studios#index"

  get '/movies/:movie_id', to: "movies#show"
  patch '/movies/:movie_id', to: "movies#update"
end
