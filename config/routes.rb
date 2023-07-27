Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }

  get 'enter_sms_code', to: 'sms_verification#new', as: 'enter_sms_code'
  post 'enter_sms_code', to: 'sms_verification#create'

  post 'votes', to: 'votes#create'
  get 'votes', to: 'votes#index'
  root 'votes#index'
end
