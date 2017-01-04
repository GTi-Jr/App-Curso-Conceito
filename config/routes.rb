Rails.application.routes.draw do
  

 
  devise_for :users,  controllers: {
    sessions: 'api/users/sessions',
    confirmations: 'api/users/confirmations',
    passwords: 'api/users/passwords',
    registrations:'api/users/registrations',
    omniauth_callbacks: 'api/users/omniauth_callbacks'
  }

  authenticated :user do
    resources :users
    root 'api_dashboard#index'

  end

  unauthenticated :user do
    root 'api_dashboard#index'
  end




  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    confirmations: 'admins/confirmations',
    passwords: 'admins/passwords',
    registrations:'admins/registrations'
  },
  path: '',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'registration',
    sign_up: 'new'
  } , skip: [:registrations]

  authenticated :admin do
    resources :users
  end

  unauthenticated :admin do
  end

  root 'dashboard#index'
  
 
end