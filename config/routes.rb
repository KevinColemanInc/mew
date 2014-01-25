Mew::Application.routes.draw do
  resources :case_managers

  resources :member_groups
  get "members/:id/email_messages/new" => "email_messages#new", as: "new_email_message"
  post "members/:id/email_messages" => "email_messages#create"
  get "members/:id/email_messages" => "email_messages#index", as: "email_messages"
  get "members/:id/email_messages/:email_message_id" => "email_messages#show", as: "email_message"

  devise_for :users, controllers: {:sessions => 'users/sessions', :registrations => 'users/registrations'}
  resources :members
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
