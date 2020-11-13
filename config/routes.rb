Rails.application.routes.draw do
  root to: "games#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/auth/facebook/callback' => 'sessions#facebook'
  resources :sessions, only: [:create, :new, :destroy]
  
  resources :users do
    resources :reviews
  end
  resources :games do
    resources :reviews
  end
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
