Rails.application.routes.draw do
  root 'home#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

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
  resources :tickets do
    put :close
    resources :tickets_answers, path: 'answers'
  end
end
