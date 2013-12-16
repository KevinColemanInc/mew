Mew::Application.routes.draw do
  resources :glucose_levels

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'glucose_levels#index'

end
