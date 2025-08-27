Rails.application.routes.draw do
  # Admin routes
  scope "/admin" do
    root "home#index"
    get "home/index"

    resources :production_companies

    resources :people

    resources :productions do
      resources :shows
      resources :call_to_auditions do
        resources :audition_sessions
        resources :audition_requests

        post "audition_requests/:id/set_status/:status", to: "audition_requests#set_status", as: "audition_request_set_status"
      end
    end

    resources :questions
    resources :auditions

    resources :cast_members
    resources :show_cast_assignments
    resources :cast_roles
    resources :casts
    resources :audition_requests
  end

  # Public-facing routes
  get "/respond_to_call/:hex_code", to: "respond_to_call_to_audition#new", as: "respond_to_call_to_audition"
  post "/respond_to_call/:hex_code", to: "respond_to_call_to_audition#create", as: "handle_respond_to_call_to_audition"
  get "/respond_to_call/:hex_code/success", to: "respond_to_call_to_audition#success", as: "respond_to_call_to_audition_success"
end
