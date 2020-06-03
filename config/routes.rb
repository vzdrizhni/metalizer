Rails.application.routes.draw do

  resources :articles do
    resources :votes
  end
  root 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/categories', to: 'categories#new'
  post '/categories', to: 'categories#create'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
