Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    # get '/studios', to: 'studios#index'
   resources :studios, only: [:index]
   resources :movies, only: [:show]
end
