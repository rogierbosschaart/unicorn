Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"

  # AGENCY
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :listings, only: [:create]
  resources :connections, only: [:create]
  resources :clients, only: [:create]
  resources :hotels, only: [:create]
  resources :travels, only: [:create]

  # MODELS
  get 'home', to: 'model_agency_profiles#home', as: :home
  get 'inbox', to: 'model_agency_profiles#inbox', as: :inbox
  get 'travel', to: 'model_agency_profiles#travel', as: :travel
end
