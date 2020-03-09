Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, path: 'profile', controllers: { registrations: "users/registrations" }

  resources :matches, only: [:index, :show, :create] do
    resources :ratings, only: [:index, :new, :create]
    resources :messages, only: [:index, :create]
  end
  patch "/matches", to: "matches#update"
  get "/matchme", to: "matches#matchme"
  resources :wall, :controller=>"bookmarks", :path => "wall"
  resources :bookmarks, only: [:destroy]
  get "/recommendations", to: "recommendations#index"
  resources :recommendations, not: [:index] do
    resources :reviews, only: [:new, :create, :destroy]
    resources :bookmarks, only: [:create]
  end
  resources :profile, :controller => "users", only: [:index, :show, :edit, :update]

  devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  #   get 'sign_out', to: 'devise/sessions#destroy'
  #   get 'signup', to: 'devise/registrations#new'
  end
end
