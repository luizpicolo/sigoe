Rails.application.routes.draw do
  get 'permission/index'

  root 'home#index'

  # Devise Routes
  devise_for :user, path: 'auth', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'register',
      sign_up: 'signup'
  }, controllers: {
      # :registrations => 'registrations',
      :sessions => 'sessions',
      #:omniauth_callbacks => 'omniauth_callbacks'
  }

  # routes
  resources :users, except: [:show] do
    get :change_password
    resources :permissions, except: [:show]
  end
  resources :sectors, except: [:show] do
    get :actions
  end
  resources :keypasses, except: [:show]
  resources :students, except: [:show] do
    get :import_xls, to: 'students#send_xls', on: :collection
    post :import_xls, to: 'students#import_xls', on: :collection
  end
  resources :courses, except: [:show]
  resources :incidents do
    get :sign, to: 'incidents#confirmation'
    post :sign, to: 'incidents#sign'
  end
  resources :report_incidents, only: [:new, :create]
  resources :positions, except: [:show]
end
