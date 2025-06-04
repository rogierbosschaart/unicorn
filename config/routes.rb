Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"

  # AGENCY
  get 'dashboard', to: 'pages#dashboard', as: :dashboard


  # MODELS
  get 'home', to: 'model_agency_profiles#home', as: :home
  get 'inbox', to: 'model_agency_profiles#inbox', as: :inbox
  get 'travel', to: 'model_agency_profiles#travel', as: :travel

  resources :listings, only: [:create]
  resources :connections, only: [:create]
  end
end
