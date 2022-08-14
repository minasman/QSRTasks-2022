require 'sidekiq/web'
Rails.application.routes.draw do
  root 'public#home'
  get 'public/about'
  get 'public/careers'

  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

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
    get '/ftks_comments' => 'comments#ftks_comments'
  end

  scope module: 'documentations' do
    resources :documents do
      collection do
        get :level_list
      end
    end
    resources :documentations do
      collection do
        get :employee_list
        get :level_list
        get :document_list
      end
    end
    resources :rewards do
      collection do
        get '/redeem_points/:id/reward/:reward_id' => 'rewards#redeem_points'
      end
    end
    resources :oepe_imports
    get '/rewards/claim_my_reward/:id' => 'rewards#claim_my_reward'
    get '/pending_to_redeem/' => 'rewards#pending_to_redeem'
    get '/pay_out/:id/:reward' => 'rewards#pay_out'
  end

  resources :shops
  get '/manager_list' => 'shops#manager_list'


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
    get '/my_workorders/:id' => 'workorders#my_workorders'
  end

  scope module: 'training' do
    resources :training_registration
    resources :tclasses
    resources :curriculums
    #resources :mocs
    resources :food_handler_cards
    get '/get_classes' => 'training_registration#get_classes'
    get '/register' => 'training_registration#register'
    get '/schedule' => 'curriculums#schedule'
    get '/my_schedule/:id' => 'curriculums#my_schedule'
    get '/day_schedule' => 'curriculums#day_schedule'
    get '/training_history/:id' => 'curriculums#training_history'
    get '/remove_class_from_list/:id/:tclass_id' => 'tclasses#remove_class_from_list'
    get '/remove_class/:id/:tclass_id' => 'tclasses#remove_class'
  end

  resources :new_hires
  get '/verify_rehire' => 'new_hires#verify_rehire'
  get '/approve_background' => 'new_hires#approve_background'
  get '/update_background' => 'new_hires#update_background'
  get '/attended' => 'new_hires#attended'
  get '/comment_update' => 'new_hires#comment_update'

  scope module: 'audits' do
    resources :safe_audits do
      collection do
        get :manager_list
      end
    end
    resources :food_safety_audits do
      collection do
        get :manager_list
      end
    end
  end

  scope module: 'covid' do
    resources :covid_statuses
    resources :wellnesses
  end

  scope module: 'reports' do
    resources :documentation_reports
    resources :workorder_reports
    resources :comment_reports
  end

  resources :positions
  resources :organizations

end
