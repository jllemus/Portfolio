Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only:[:new, :create, :destroy]
  resources :projects
  resources :users, only: [:index]
  resources :contacts, only: [:new, :create]
  
  root 'pages#home'
  get '/about' => "pages#about"
  #get 'root', to: 'pages#home' 
  get '/login' => "sessions#new", as: 'login'
  get '/logout' => "sessions#destroy", as: 'logout'
end
