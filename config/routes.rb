Rails.application.routes.draw do
  resources :followers
  resources :organizations, only: [:new, :show, :index, :create]
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#landing'

  resources :users do 
  	resources :followers
  end
  

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
