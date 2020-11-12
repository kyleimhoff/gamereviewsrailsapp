Rails.application.routes.draw do
  root to: "games#index"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  
  resources :user do
    resorces :game_reviews
  end
  resorces :game do
    resources :game_reviews
  end
  resources :game_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
