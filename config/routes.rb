Rails.application.routes.draw do
  resources :auditions
  resources :audition_sessions
  resources :cast_members
  resources :show_cast_assignments
  resources :cast_roles
  resources :casts
  resources :audition_requests
  resources :call_to_auditions
  root "home#index"

  get "home/index"

  resources :shows
  resources :people
  resources :productions
  resources :production_companies
end
