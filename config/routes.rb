Rails.application.routes.draw do
  resources :organizations, only: [:new, :show, :index, :create]
  get 'sessions/new'

  root 'welcome#landing'

  resources :users do 
  	resources :followers
  end

  resources :users, only: [:new, :create,:edit,:update,:destroy]
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
