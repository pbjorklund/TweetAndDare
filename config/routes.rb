RailsRumble::Application.routes.draw do
  resources :dares, only: [:index,:create,:show, :update]

  resources :dashboard, only: [:index, :show]

  resources :authentications

  match "/logout" => "sessions#destroy", as: :logout

  match "/auth/twitter/callback" => "authentications#create"

  root to: 'dares#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

end
