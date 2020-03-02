Rails.application.routes.draw do
  devise_for :users, path: 'profile'
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
    get 'signup', to: 'devise/registrations#new'
  end
  root to: 'pages#home'
  resources :profile, :controller => "users", only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
