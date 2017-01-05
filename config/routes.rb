Rails.application.routes.draw do

 
  devise_for :users,  controllers: {
    sessions: 'api/users/sessions',
    confirmations: 'api/users/confirmations',
    passwords: 'api/users/passwords',
    registrations:'api/users/registrations',
    omniauth_callbacks: 'api/users/omniauth_callbacks'
  }

  authenticated :user do
    get 'loginapi' => 'api_dashboard#index'
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
    resources :categories
    resources :subcategories


    post 'search/categories' => 'categories#search'
    post 'search/sub_categories' => 'sub_categories#search'


    resources :contents

  end

  unauthenticated :admin do
  end

  root 'dashboard#index'
  
 
end