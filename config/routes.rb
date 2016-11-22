Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  devise_for :users, path: 'account', controllers: {
      sessions: 'users/sessions',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }

  # get '/auth/:provider/callback', to: 'sessions#create'

  resources :users

end
