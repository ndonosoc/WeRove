Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: 'profile', controllers: { registrations: "users/registrations" }
  resources :matches, only: [:index, :create]
  patch "/matches", to: "matches#update" unless params[:recommendations].presence?
  get "/matchme", to: "matches#matchme"

  get "/recommendations", to: "recommendations#index"
  resources :recommendations, not: [:index]
  resources :profile, :controller => "users", only: [:index, :show, :edit, :update]

  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  #   get 'logout', to: 'devise/sessions#destroy'
  #   get 'sign_out', to: 'devise/sessions#destroy'
  #   get 'signup', to: 'devise/registrations#new'
  # end
end
