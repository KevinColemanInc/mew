Mew::Application.routes.draw do

  namespace :api, :constraints => {:format => /(json)/} do
    namespace :v1 do
      devise_for :users, controllers: {:sessions => 'api/v1/users/sessions'}
      resources :meters, only: [:create]
      resources :measurements, only: [:create, :show, :index, :update]
      resources :communication_devices, only: [:create, :show, :update]

      resources :reports
      match '/reports/:id/run' => 'reports#run', via: [:get], as: :api_v1_run_report
    end
  end

  resources :case_managers do 
    resources :managed_members, only: [:index, :create, :destroy]
  end

  resources :member_groups, except: [:show] do
    resources :grouped_members, only: [:index, :create, :destroy]
  end

  resources :reports

  resources :members do
    resources :email_messages, only: [:index, :create, :new, :show]
    resources :measurements
    resources :case_managers, only: [:index]
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
