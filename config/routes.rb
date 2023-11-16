Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  get '/recipes/public'
  resources :foods, only: [:index, :new, :create, :destroy, :show]
  resources :recipes, except: [:edit, :update] do
    member do
      patch :public_toggle
    end
  end
  resources :recipes, except: %i[edit update] do
    resources :recipe_foods, except: %i[edit update]
    collection do
      get 'public'
    end
    member do
      get 'general_shopping_list'
    end
  end
  resources :recipe_foods, only: [:new, :create, :destroy] do
    patch :modify, on: :member
  end
end