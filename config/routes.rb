Rails.application.routes.draw do
  root "home#index"

  # Utility
  get "/up", to: proc { [ 200, {}, [ "OK" ] ] }

  # Landing page
  get "home/index"
  post "/notify_me", to: "home#notify_me", as: "notify_me"
  get "/notify_me/success", to: "home#notify_me_success", as: "notify_me_success"

  # Public-facing routes
  get "/audition/:hex_code", to: "respond_to_call_to_audition#new", as: "respond_to_call_to_audition"
  post "/audition/:hex_code", to: "respond_to_call_to_audition#create", as: "handle_respond_to_call_to_audition"
  get "/audition/:hex_code/success", to: "respond_to_call_to_audition#success", as: "respond_to_call_to_audition_success"
  get "/audition/:hex_code/inactive", to: "respond_to_call_to_audition#inactive", as: "respond_to_call_to_audition_inactive"

  resource :session
  resources :passwords, param: :token

  scope "/app" do
    get "/", to: "dashboard#index", as: "dashboard"

    resources :production_companies
    resources :people
    resources :productions do
      resources :shows
      resources :call_to_auditions do
        resources :questions
        resources :audition_requests
        # Set status on audition requests
        post "audition_requests/:id/set_status/:status", to: "audition_requests#set_status", as: "audition_request_set_status"
      end
      resources :audition_sessions


      # Addition Call To Audition routes
      get "call_to_auditions/:id/preview", to: "call_to_auditions#preview", as: "call_to_audition_preview"
    end

    resources :auditions
    resources :cast_members
    resources :show_cast_assignments
    resources :cast_roles
    resources :casts
  end
end
