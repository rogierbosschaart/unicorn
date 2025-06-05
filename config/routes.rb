Rails.application.routes.draw do
  devise_for :users
  root to: "pages#root"

  # AGENCY
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  # resources :listings, only: [:new, :create]
  resources :connections, only: [:new, :create]
  resources :clients, only: [:new, :create]
  # resources :hotels, only: [:new, :create]
  # resources :travels, only: [:new, :create]
  resources :agencies do
   resources :listings, only: [:new, :create]
   resources :travels, only: [:new, :create]
   resources :hotels, only: [:new, :create]
  end

  # MODELS
  get 'home', to: 'model_agency_profiles#home', as: :home
  get 'inbox', to: 'model_agency_profiles#inbox', as: :inbox
  get 'travel', to: 'model_agency_profiles#travel', as: :travel
end
