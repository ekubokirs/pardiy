Pardiy::Application.routes.draw do
  
  get "event/new"
  get "event/create"
  get "event/edit"
  get "event/update"
  get "event/destroy"
  get "privacy" => "site#privacy"
  get "terms" => "site#terms"
  
  get "reset/:code" => "password#edit"
  patch "password" => "password#update", as: :password
  
  get "login" => "session#new"
  post "login" => "session#create"
  delete "logout" => "session#destroy"
  get "logout" => "session#destroy"
  
  resources :users
  
  root 'site#index'
end