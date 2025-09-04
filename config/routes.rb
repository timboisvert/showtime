Rails.application.routes.draw do
  root "home#index"

  # Landing page
  get "home/index"
  post "/notify_me", to: "home#notify_me", as: "notify_me"
  get "/notify_me/success", to: "home#notify_me_success", as: "notify_me_success"

  resource :session
  resources :passwords, param: :token

  resources :production_companies

  resources :people

  resources :productions do
    resources :shows
    resources :call_to_auditions do
      resources :questions
      resources :audition_sessions
      resources :audition_requests

      # Set status on audition requests
      post "audition_requests/:id/set_status/:status", to: "audition_requests#set_status", as: "audition_request_set_status"
    end

    # Addition Call To Audition routes
    post "call_to_auditions/:id/end_early", to: "call_to_auditions#end_early", as: "call_to_audition_end_early"
    get "call_to_auditions/:id/preview", to: "call_to_auditions#preview", as: "call_to_audition_preview"
  end

  resources :questions
  resources :auditions

  resources :cast_members
  resources :show_cast_assignments
  resources :cast_roles
  resources :casts
  resources :audition_requests


  # Public-facing routes
  get "/auditions/:hex_code", to: "respond_to_call_to_audition#new", as: "respond_to_call_to_audition"
  post "/auditions/:hex_code", to: "respond_to_call_to_audition#create", as: "handle_respond_to_call_to_audition"
  get "/auditions/:hex_code/success", to: "respond_to_call_to_audition#success", as: "respond_to_call_to_audition_success"
end
