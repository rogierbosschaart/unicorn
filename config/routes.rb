Rails.application.routes.draw do
  devise_for :users
  root to: "pages#root"

  # AGENCY
  get 'dashboard', to: 'pages#dashboard', as: :dashboard
  resources :connections, only: [:new, :create, :show] do
    resources :connection_comments, only: [:create]
  end
  resources :clients, only: [:new, :create]
  resources :posts, only: [:index, :new, :create]

  resources :model_agency_profiles, only: [:update, :edit]
  resources :agencies do
    resources :listings, only: [:index, :show, :new, :create]
    resources :hotels, only: [:index, :show, :new, :create]
    resources :travels, only: [:index, :show, :new, :create]
  end

  # MODELS
  get 'home', to: 'model_agency_profiles#home', as: :home
  get 'inbox', to: 'model_agency_profiles#inbox', as: :inbox
  get 'travel', to: 'model_agency_profiles#travel', as: :travel
end
