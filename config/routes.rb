Rails.application.routes.draw do
  resources :view_parties
  resources :streaming_services
  resources :movies
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
