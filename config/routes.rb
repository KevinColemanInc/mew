Mew::Application.routes.draw do
  resources :patient_groups
  
  devise_for :patients, controllers: {:sessions => 'patients/sessions'}
  devise_for :case_managers, controllers: {:sessions => 'case_managers/sessions'}
  resources :patients
  resources :communication_devices
  resources :meters

  

  mount RailsAdmin::Engine => '/admin_panel', :as => 'rails_admin'
  resources :measurements

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'high_voltage/pages#show', id: 'home'

  post 'glucose_levels' => 'glucose_levels#create'

end
