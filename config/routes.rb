Rails.application.routes.draw do

  namespace :api do
    # url/users/auth/facebook (GET OU POST)
    # url/users/sign_out (GET)
    get 'lessons/index' => 'lessons/lessons#index'
    get 'categories/index' => 'categories/categories#index'
    get 'subcategories/index' => 'subcategories/subcategories#index'
    get 'contents/index' => 'contents/contents#index'
    get 'subscribe/lesson/:lesson_id' => 'subscribe/subscribes#request_sub'
  end

  devise_for :users,  controllers: {
    sessions: 'api/users/sessions',
    confirmations: 'api/users/confirmations',
    passwords: 'api/users/passwords',
    registrations:'api/users/registrations',
    omniauth_callbacks: 'api/users/omniauth_callbacks'
  }

  get 'loginapi' => 'api_dashboard#index'



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
    post 'search/subscribeds' => 'subscribeds#search'
    post 'updatesubs/subscribeds' => 'subscribeds#updatesubs'
    get 'subscribeds/:id' => 'subscribeds#index', as: :show_presences

    resources :contents

  end

  unauthenticated :admin do
  end

  root 'dashboard#index'


end
