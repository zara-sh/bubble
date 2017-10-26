Rails.application.routes.draw do
  # get 'categories/show'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', confirmations: 'confirmations' }
  root to: 'pages#home'
  get "search", to: 'pages#search'
  get 'profile', to: 'pages#profile'
  get 'profile/edit', to: 'pages#edit'
  patch "profile/edit", to: "pages#update"
  delete "profile/delete", to: 'pages#destroy'
  get 'experiences/show_all', to: 'experiences#show_all'
  resources :experiences, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show]
  resources :categories, only: [:show]
  # resources :bookings, only: [:show]

  # keeping the comment below just in case my modifications above don't actually work as intended
  # devise_for :users, controllers: { confirmations: 'confirmations' }

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

