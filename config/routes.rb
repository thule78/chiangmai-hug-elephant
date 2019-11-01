Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'tours#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :users, only: [:show]
  resources :contacts, only: [:new, :create, :destroy, :index, :show]

  resources :tours, only: [:index, :show, :destroy, :new, :create, :update] do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:update, :destroy, :index]
  resources :contacts, only: [:update, :destroy, :index, :new, :create]

  namespace :providers do
    resources :tours, only: [:index, :edit, :destroy]
  end

  match "/404", to: "errors#not_found", via: :all
  match "/422", to: "errors#unacceptable", via: :all
  match "/500", to: "errors#internal_server_error", via: :all


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
