Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "user_jobs#index"

#   resources :jobs
#   resources :phases
#   resources :networking_events


#   resources :users do
#     resources :user_points
#     resources :user_jobs
#     resources :user_networking_events
    
  resources :users, only: [:new, :create, :show] do
    resources :user_jobs, only: [:new, :create, :show] 
  end

  resources :user_jobs, only: [:new, :create, :show] do
    resources :notes, only: [:new, :create, :update, :destroy]
    resources :events, only: [:new, :create, :show]
  end


#   resources :job_phases do
#     resources :phases
#     resources :notes
#     resources :events
#   end

#   resources :user_networking_events do
#     resources :notes
#     resources :events
#   end

end
