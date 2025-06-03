Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :agency, only: [:show] do
    resources :connection, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :listing, only: [:show, :update]
      resources :connection_comment, only: [:index, :new, :create]
    end
    resources :listing, only: [:index, :new]
  end
end
