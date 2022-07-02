Rails.application.routes.draw do

  root 'public#home'
  get 'public/about'
  get 'public/careers'

  get '/dashboard' => 'dashboard#dashboard'
  get 'admin/dashboard' => 'dashboard#admin_dashboard'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords',
    masquerades: 'admins/masquerades'
  }
  resources :user

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks',
    passwords: 'admins/passwords'
  }

  resources :positions
  resources :organizations

end
