Pardiy::Application.routes.draw do

  get "privacy" => "site#privacy"
  get "terms" => "site#terms"
  
  get "reset/:code" => "password#edit"
  patch "password" => "password#update", as: :password
  
  get "login" => "session#new"
  post "login" => "session#create"
  delete "logout" => "session#destroy"
  get "logout" => "session#destroy"

  get "register/:code" => "users#new", as: :registration
  post "register/:code" => "users#create"
  
  resources :users
  resources :events


  root 'site#index'
end