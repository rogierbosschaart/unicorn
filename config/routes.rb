Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :agency, only: [:show] do
    resources :listing, only: [:index, :new]
  end
end
