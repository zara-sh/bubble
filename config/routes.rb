Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "search", to: 'pages#search'
  get 'profile', to: 'pages#profile'
  get 'profile/edit', to: 'users#edit'
  patch "profile/edit", to: "users#update"
  resources :experiences, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :experiences do
    resources :bookings, only: [:new, :create]
  end
  # resources :bookings, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
