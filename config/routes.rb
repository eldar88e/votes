Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "users#index"

  post 'votes', to: 'votes#create'
  get 'votes', to: 'votes#index'

  #delete 'users/sign_out', to: devise/sessions#destroy

  root 'votes#index'
end
