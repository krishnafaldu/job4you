Rails.application.routes.draw do
  resources :notifications
  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  devise_for :recruiters, 
    controllers: {
    registrations:  "recruiters/registrations"
  }
  devise_for :job_seekers, 
    controllers: {
    registrations:  "job_seekers/registrations",
    omniauth_callbacks: "job_seekers/omniauth_callbacks"
  }
  resources :dashbords
  
  namespace :job_seekers do
    resources :job_seekers
    resources :job_applications
    resources :job_ads, only: [:index, :show]
  end

  namespace :recruiters do
    resources :recruiters
    resources :job_seekers, only: [:index, :show]
    resources :appointeds
    resources :job_ads
    resources :job_applications, only: [:index, :show, :destroy]
  end
  root 'dashbords#dashbord'

  require 'sidekiq/web'

  mount Sidekiq::Web, at: '/sidekiq'
end
