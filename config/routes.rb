Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "jobs#index"

  resources :users, only: [:new, :create, :show] do
    resources :events, only: [:new, :create, :show]
    resources :rubrics, only: [:new, :create, :show]
    resources :notes, only: [:new, :create, :show]
  end

  resources :networking_events

  resources :jobs, only: [:new, :create, :show] do
    resources :notes, only: [:new, :create, :update, :destroy]
    resources :events, only: [:new, :create, :show]
  end



end
