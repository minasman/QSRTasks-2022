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
  get '/inactive_users' => 'user#inactive_users'

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks',
    passwords: 'admins/passwords'
  }

  resources :stores
  get '/inactive_stores' => 'stores#inactive_stores'
  get '/store_roster/:id' => 'stores#store_roster'

  scope module: 'comments' do
    resources :guests
    resources :comments do
      resources :comment_updates, only: %i[new create index]
    end
  end

  scope module: 'maintenance' do
    resources :vendors
  end

  resources :positions
  resources :organizations

end
