Rails.application.routes.draw do

 devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "jobs#index"

  resources :users, only: [:new, :create, :show] do
    resources :rubrics, only: [:new, :create, :show, :edit, :update]
    resources :events, only: [:index, :new, :create, :show]
    resources :notes, only: [:index, :new, :create, :show]
  end

  resources :networking_events

  resources :jobs, only: [:index, :new, :create, :show, :edit, :update] do

    resources :notes, only: [:new, :create, :update, :destroy]
    resources :events, only: [:new, :create, :show]
  end
end
