Rails.application.routes.draw do

  resources :organizations, only: [:new, :show, :index, :create]
  get 'sessions/new'

  root 'welcome#landing'

  resources :users do 
  	resources :followers
    resources :uploads, only: [:new, :create, :index, :destroy, :show]
  end

  resources :users, only: [:new, :create,:edit,:update,:destroy]

  get '/notes/new', :to => 'notes#new', :as => :new_note
  get '/notes/:id', :to => 'notes#show', :as => :notes
  post '/notes/new', :to => 'notes#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
