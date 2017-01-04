Rails.application.routes.draw do


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
    resources :categories
    resources :sub_categories
    post 'search/categories' => 'categories#search'
    post 'search/sub_categories' => 'sub_categories#search'
  end

  unauthenticated :admin do
  end
  
  root 'dashboard#index'
end