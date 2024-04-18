# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  # Devise Routes
  devise_for :user, path: 'auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'register',
      sign_up: 'signup'
  }, controllers: {
      # :registrations => 'registrations',
      sessions: 'sessions'
    # :omniauth_callbacks => 'omniauth_callbacks'
  }

  # routes
  resources :users, except: [:show] do
    get :change_password
    resources :permissions, except: [:show]
  end
  resources :students, except: [:show] do
    get :import_xls, to: 'students#send_xls', on: :collection
    post :import_xls, to: 'students#import_xls', on: :collection
  end
  resources :courses, except: [:show]
  resources :incidents do
    get :sign, to: 'incidents#confirmation'
    post :sign, to: 'incidents#sign'
    get :export_to_academic_system, to: 'incidents#export_to_academic_system'
  end
  resources :report_incidents, only: %i[new create]
  resources :school_groups, except: [:show]
end
