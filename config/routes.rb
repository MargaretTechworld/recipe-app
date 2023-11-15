Rails.application.routes.draw do
  devise_for :users
  
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/recipes/public', to: 'recipes#public'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only:[:index, :new, :create, :destroy]

  # Defines the root path route ("/")
  # root "posts#index"
end
