Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users, only: [:show]
    resources :jobs, only: [:index, :show]
    resources :user_jobs, only: [:index, :show]

  root to: "user_jobs#index"

end
