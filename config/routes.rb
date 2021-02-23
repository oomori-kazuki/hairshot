Rails.application.routes.draw do
  root to: 'toppages#index'
  
  resources :favorites, only: [:create, :destroy]
  
  resources :relationships, only: [:create, :destroy]
  
  get "general/login", to: 'general_sessions#new'
  post "general/login", to: 'general_sessions#create'
  delete "general/logout", to: 'general_sessions#destroy'
  
  get "general_user_signup", to: "general_users#new"
  resources :general_users, only: [:show, :create, :edit, :update, :destroy] do
    member do
      get :followings
      get :likes
    end
  end
  
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
  
  resources :posts, except: [:index]
  get "mensperms", to: "mensperms#index"
  get "menscolors", to: "menscolors#index"
  get "ladiesperms", to: "ladiesperms#index"
  get "ladiescolors", to: "ladiescolors#index"
end
