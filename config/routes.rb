Rails.application.routes.draw do
  resources :organizations, only: [:new, :show, :index, :create]
  get 'sessions/new'

  root 'welcome#landing'

  resources :users do 
  	resources :followers
  end

  resources :users, only: [:new, :create,:edit,:update,:destroy]

  get '/note/new', :to => 'note#new', :as => :new_note
  get '/note/:id', :to => 'note#show', :as => :notes
  post '/note/new', :to => 'note#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
end
