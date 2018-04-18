Rails.application.routes.draw do
  root 'application#hello'

  resources :users
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
end
