RailsRumble::Application.routes.draw do


  root to: 'dares#index'

  resources :dares, only: [:index,:create,:show]

  resources :dashboard, only: [:index, :show]

  resources :authentications do
    collection do
      get "log_out"
    end
  end

  match "/auth/twitter/callback" => "authentications#create"

  # The priority is based upon order of creation:
  # first created -> highest priority.

end
