Rails.application.routes.draw do
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
  resources :users, except: [:show]
  resources :sectors, except: [:show] do
    get :actions
  end
  resources :keypasses, except: [:show]
  resources :students, except: [:show]
  resources :courses, except: [:show]
  resources :incidents, except: [:show]
  resources :positions, except: [:show]
end
