ImagineCo::Application.routes.draw do


  get "pages/index"

  resources :users
  resources :admins
  resources :answers
  resources :questions
  resources :lessons
  resources :lesson_templates
  
  match "admin-login" => "admin_sessions#check_session", :as => :login
  match "admin-logout" => "admin_sessions#destroy", :as => :logout
  
  root :to => "pages#index"
  
end
