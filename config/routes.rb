Rails.application.routes.draw do
  
  root "home#index"

  get "home/index"

  resources :shows
  resources :people
  resources :productions
  resources :production_companies
  resources :call_to_auditions
  resources :questions
  resources :auditions
  resources :audition_sessions
  resources :cast_members
  resources :show_cast_assignments
  resources :cast_roles
  resources :casts
  resources :audition_requests

  get '/respond_to_call/:hex_code', to: 'audition_requests#respond_to_call_to_audition', as: 'respond_to_call_to_audition'
end
