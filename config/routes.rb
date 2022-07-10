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

  scope module: 'documentations' do
    resources :documents
  end

  scope module: 'maintenance' do
    resources :workorders do
      resources :workorder_updates, only: %i[new create index]
      collection do
        get :equipment_types
        get :equipment_choices
      end
    end
    get '/assign_workorders' => 'workorders#assign'
    get '/weekly_recap' => 'workorders#weekly_recap'
    scope module: 'equipment' do
      resources :equipment do
        collection do
          get :add_equipment
        end
      end
    end
    resources :vendors
  end

  scope module: 'audits' do
    resources :safe_audits
    #resources :food_safety_audits
  end

  resources :positions
  resources :organizations

end
