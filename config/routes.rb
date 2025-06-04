Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  resources :agencies, only: [:show] do
    resources :listings, only: [:index, :new, :create]
    resources :connections, only: [:index, :show, :new, :create]
    resources :travels, only: [:index]
    resources :hotels, only: [:index]
  end
end
