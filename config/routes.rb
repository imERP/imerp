Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  devise_for :users, path: 'account', controllers: {
      login: 'users/sessions',
      logout: 'users/sessions#sign_out',
      omniauth_callbacks: 'users/omniauth_callbacks'
    }



  # get '/auth/:provider/callback', to: 'sessions#create'

  resources :users

end
