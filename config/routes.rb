ImagineCo::Application.routes.draw do

  # Admin Paths
  match "admin-login" => "admin_sessions#check_session", :as => :login
  match "admin-logout" => "admin_sessions#destroy", :as => :logout
  match "admin-dashboard" => "admins#show", :as => :admin_dashboard
  
  # Teacher Login
  match "teacher-login" => "teacher_sessions#new", :as => :teacher_login
  match "teacher-logout" => "teacher_sessions#destroy", :as => :teacher_logout
  match "teacher-dashboard" => "accounts#show", :as => :teacher_dashboard
  
  # Student Login
  match "student-login" => "student_sessions#new", :as => :student_login
  match "student-logout" => "student_sessions#destroy", :as => :student_logout
  match "student-dashboard" => "students#show", :as => :student_dashboard
  
  # Ajax Routes
  match "assign-curriculum" => "ajax#assign_curriculum", :as => :assign_curriculum
  
  # Base Routes
  match "home" => "pages#index", :as => :home
  match "about" => "pages#about", :as => :about
  
  
  resources :students
  resources :student_sessions
  resources :teacher_sessions
  resources :teachers
  resources :admins
  resources :admin_sessions
  resources :answers
  resources :questions
  resources :lessons
  resources :lesson_templates
  resources :accounts
  resources :classrooms
  resources :curriculums
  resources :lesson_results
  
  root :to => "pages#index"
  
end
