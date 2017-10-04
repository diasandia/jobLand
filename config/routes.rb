Rails.application.routes.draw do

 devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/redirect', to: 'events#redirect', as: 'redirect'
  get '/callback', to: 'events#callback', as: 'callback'
  # get '/calendars', to: 'events#calendars', as: 'calendars'

  root to: "jobs#index"

  resources :users, only: [:new, :create, :show] do
    resources :events, only: [:index, :new, :create, :show]
    resources :rubrics, only: [:new, :create, :show]
    resources :notes, only: [:new, :create, :show]
    member do
      get :calendars
    end
  end

  resources :networking_events

  resources :users, only: [:new, :create, :show]

  resources :jobs, only: [:new, :create, :show, :edit, :update] do
    resources :notes, only: [:new, :create, :update, :destroy]
    resources :events, only: [:new, :create, :show]
  end
end
