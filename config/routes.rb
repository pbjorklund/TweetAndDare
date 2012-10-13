RailsRumble::Application.routes.draw do

  root to: 'dares#index'

  resources :dares, only: [:index,:create,:show]

end
