Rails.application.routes.draw do
  get 'recipe_foods/new'
  get 'recipe_foods/create'
  get 'recipe_foods/show'
  get 'recipe_foods/modify'
  get 'recipe_foods/destroy'
  devise_for :users
  root "users#index"

  get '/recipes/public', to: 'recipes#public'
  
  resources :foods, only: [:index, :new, :create, :destroy, :show]
  
  resources :recipes, except: [:edit, :update] do
    patch :public_toggle, on: :member
    get 'public', on: :collection
    get 'general_shopping_list', on: :member

    resources :recipe_foods, only: [:new, :create, :destroy] do
      patch :modify, on: :member
    end
  end
end