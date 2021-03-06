Rails.application.routes.draw do
  #DATA TABLES
  resources :relationships
  resources :view_parties
  resources :streaming_services
  resources :movies
  resources :users
  resources :user_view_parties
  resources :user_movies

  #Custom Paths

  get '/top_rated', to: 'movies#top_rated', as: 'top_rated'
  
  #API 
  get '/search', to: 'api#search', as: 'api_search'
  post '/search/results', to: 'api#results', as: 'api_results'
  get '/movie_details/:movie_id', to: 'api#movie_details', as: 'movie_detail'

  #SESSIONS 
  
  delete '/logout', to: 'sessions#logout', as: 'logout'
  post '/login', to: 'sessions#login', as: 'login'
  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  root to: 'welcome#home', as: 'welcome'
  post '/make_friend', to: 'relationships#make_friend', as: 'new_friend'
  delete '/delete_friend', to: 'relationships#delete_friend', as: 'delete_friend'
  get '/new_view_party', to: 'view_parties#solo_party', as: 'new_solo_party'
  post '/join_view_party', to: 'user_view_parties#join_view_party', as: 'join_view_party'
  delete '/leave_view_party', to: 'user_view_parties#leave_view_party', as: 'leave_view_party'
  get '/friend/watch_list', to: 'relationships#watch_list', as: 'friend_watch_list'
  delete '/unsubscribe', to: 'streaming_services#unsubscribe', as: 'unsubscribe'
  post '/subscribe', to: 'streaming_services#subscribe', as: 'subscribe'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
