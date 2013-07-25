Pardiy::Application.routes.draw do
  
  resources :pw_setters

  get "privacy" => "site#privacy"
  get "terms" => "site#terms"
  
  get "reset/:code" => "password#edit"
  patch "password" => "password#update", as: :password
  
  get "login" => "session#new"
  post "login" => "session#create"
  delete "logout" => "session#destroy"
  get "logout" => "session#destroy"
  
  resources :users
  resources :profiles
  resources :events
  resources :pw_setters
  
  root 'site#index'
end