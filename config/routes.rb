Mew::Application.routes.draw do

  resources :case_managers do 
    resources :managed_members, only: [:index, :create, :destroy]
  end

  resources :member_groups do
    resources :grouped_members, only: [:index, :create, :destroy]
  end

  resources :members do
    resources :email_messages, only: [:index, :create, :new, :show]
    resources :measurements
  end


  devise_for :users, controllers: {:sessions => 'users/sessions', :registrations => 'users/registrations'}
  resources :communication_devices
  resources :meters

  mount RailsAdmin::Engine => '/admin_panel', :as => 'rails_admin'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'high_voltage/pages#show', id: 'home'
end
