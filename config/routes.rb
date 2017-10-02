Rails.application.routes.draw do

  get 'notes/create'

  get 'notes/update'

  get 'notes/delete'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "user_jobs#index"

  resources :jobs
  resources :phases
  resources :networking_events


  resources :users, only: [:new, :create, :show] do
    resources :user_points
    resources :user_jobs
    resources :user_networking_events
  end

  resources :user_jobs do
    resources :jobs
    resources :job_phases
    resources :notes, only: [:create, :update, :destroy]
    resources :events
  end

  resources :job_phases do
    resources :phases
    resources :notes, only: [:create, :update, :destroy]
    resources :events
  end

  resources :user_networking_events do
    resources :notes, only: [:create, :update, :destroy]
    resources :events
  end

end
