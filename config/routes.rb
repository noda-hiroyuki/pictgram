Rails.application.routes.draw do
  get 'comments/new'
  get 'topics/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :comments
  resources :topics



  get 'topics/index/:id', to: 'topics#index', as: :topics_index

  #post 'topics/show', to: 'topics#show'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

  #get 'comments/index'
  post '/comments/create', to: 'comments#create'

end
