Rails.application.routes.draw do
  root to: "items#index"

  resources :users, only: [:new, :create, :show]
  resources :items do
    resources :orders, only: [:index, :create]
    resources :comments, only: :create
  end
  
  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'

end
