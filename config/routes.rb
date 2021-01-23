Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :units, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :producers, only: [:new, :create, :index, :edit, :update, :destroy]
  resources :wines, only: [:new, :create, :index, :update, :show, :edit, :update, :destroy]
  resources :bottles, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :merchants, only: [:create, :index, :destroy]
  resources :invoices, only: [:create, :index, :destroy]
  resources :storinvoices, only: [:create, :index, :destroy]
  resources :critics, only: [:create, :index, :destroy]
  resources :reviews, only: [:create, :index, :destroy]

  get 'accessibility', to: 'pages#accessibility', as: :accessibility
  get 'about', to: 'pages#about', as: :about
  get 'privacy', to: 'pages#privacy', as: :privacy
  get 'settings', to: 'pages#settings', as: :settings
  get 'latest', to: 'pages#latest', as: :latest
  get 'other', to: 'pages#other', as: :other

end
