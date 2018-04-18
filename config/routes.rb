Rails.application.routes.draw do
  root 'users#new'

  resources :users
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
end
