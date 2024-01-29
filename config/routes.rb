Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/jokes', to: 'comedy#index', as: 'jokes'

  get '/jokes/:id', to: 'comedy#show', as: 'joke'
end
