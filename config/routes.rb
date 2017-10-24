Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get "search", to: 'pages#search'
  get 'profile', to: 'pages#profile'
  get 'profile/edit', to: 'pages#edit'
  patch "profile/edit", to: "pages#update"
  delete "profile/delete", to: 'pages#destroy'
  resources :experiences, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  # resources :bookings, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
