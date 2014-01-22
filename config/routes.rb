Mew::Application.routes.draw do
  resources :patient_groups

  devise_for :patients
  devise_for :case_managers
  resources :communication_devices

  resources :measurement_devices

  mount RailsAdmin::Engine => '/admin_panel', :as => 'rails_admin'
  resources :glucose_levels

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'high_voltage/pages#show', id: 'home'

  post 'glucose_levels' => 'glucose_levels#create'

end
