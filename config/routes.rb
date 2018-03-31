Rails.application.routes.draw do
  mount ExceptionTrack::Engine => "admins/error_logs"

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do
    resource :system_info, controller: 'system_info', only: [:show]
    resource :health_check, controller: 'health_check', only: [:show]

    resources :settings, only: [:edit, :index, :update]

    get 'settings/smtp'
    put 'settings/smtp', to: 'settings#smtp_update'

    get 'settings/test'
    post "settings/test_mail", to: 'settings#test_mail'
end
end
