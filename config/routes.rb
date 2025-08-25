Rails.application.routes.draw do
  
  # Admin routes
  scope "/admin" do
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
  end

  # Public-facing routes
  get '/respond_to_call/:hex_code', to: 'respond_to_call_to_audition#new', as: 'respond_to_call_to_audition'
  post '/respond_to_call/:hex_code', to: 'respond_to_call_to_audition#create', as: 'handle_respond_to_call_to_audition'
  get '/respond_to_call/:hex_code/success', to: 'respond_to_call_to_audition#success', as: 'respond_to_call_to_audition_success'
end
