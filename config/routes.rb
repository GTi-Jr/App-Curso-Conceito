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
    get 'subscribe/lesson/:lesson_id' => 'api/subscribe/subscribes#request_sub'
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
    resources :teachers
    resources :lessons


    post 'search/categories' => 'categories#search'
    post 'search/subcategories' => 'subcategories#search'

    post 'search/users' => 'users#search'

    post 'search/contents' => 'contents#search'
    post 'search/teachers' => 'teachers#search'
    post 'search/lessons' => 'lessons#search'


    resources :contents

  end

  unauthenticated :admin do
  end

  root 'dashboard#index'
  
 
end