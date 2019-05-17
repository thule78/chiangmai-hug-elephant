Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'tours#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :users, only: [:show]

  resources :tours, only: [:index, :show, :destroy, :new, :create, :update] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update, :destroy, :index]

  namespace :providers do
    resources :bookings, only: [:index, :update, :destroy]
    resources :tours, only: [:index, :edit, :destroy]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
