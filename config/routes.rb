Rails.application.routes.draw do
  root to: "games#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  resources :users do
    resources :game_reviews
  end
  resources :games do
    resources :game_reviews
  end
  resources :game_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
