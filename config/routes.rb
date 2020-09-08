Rails.application.routes.draw do
  #DATA TABLES
  resources :relationships
  resources :view_parties
  resources :streaming_services
  resources :movies
  resources :users
  
  #API 
  get '/search', to: 'api#search', as: 'api_search'
  get '/search/results', to: 'api#results', as: 'api_results'
  get '/movie_details/:movie_id', to: 'api#movie_details', as: 'movie_detail'

  #SESSIONS 
  delete '/logout', to: 'sessions#logout', as: 'logout'
  post '/login', to: 'sessions#login', as: 'login'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  root to: 'welcome#home', as: 'welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
