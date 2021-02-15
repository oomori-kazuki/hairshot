Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get "login", to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete "logout", to: 'sessions#destroy'
  
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get :mensperms
      get :menscolors
      get :ladiesperms
      get :ladiescolors
    end
  end
  
  resources :posts
  get "mensperms", to: "mensperms#index"
  get "menscolors", to: "menscolors#index"
  get "ladiesperms", to: "ladiesperms#index"
  get "ladiescolors", to: "ladiescolors#index"
end
