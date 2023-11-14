require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get 'enter_sms_code', to: 'sms_verification#new', as: 'enter_sms_code'
    post 'enter_sms_code', to: 'sms_verification#create'

    resources :votes, only: %i[index create]

    root 'votes#index'
  end
end
