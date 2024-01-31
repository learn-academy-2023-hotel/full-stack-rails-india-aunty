Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'comedy#index', as: 'comedies'

  # INCSEUD
  # all instances
  # get '/jokes', to: 'comedy#index', as: 'comedies'

  # new instance
  get '/jokes/new', to: 'comedy#new', as: 'new'
  post '/jokes', to: 'comedy#create'
  
  # one instance
  get '/jokes/:id', to: 'comedy#show', as: 'comedy'
  
  # update an instance
  get '/jokes/:id/edit', to: 'comedy#edit', as: 'edit'
  patch '/jokes/:id', to: 'comedy#update'

  # destroy an instance
  delete '/jokes/:id', to: 'comedy#destroy', as: 'destroy'
end
