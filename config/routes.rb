Rails.application.routes.draw do
  root 'sessions#new'

  resources :events do
    member do
      patch 'assign_user_to'
    end
  end

  resources :users do
    member do
      patch 'make_admin'
    end
  end

  get   '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
