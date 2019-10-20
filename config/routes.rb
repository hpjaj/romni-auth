Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # token auth routes available at /api/v1/auth
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for(
        'User',
        at: 'auth',
        controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
      )

      resources :posts, only: [:index, :create]
    end
  end

  resources :posts
  resources :welcome, only: :index

  root to: "welcome#index"
end
