Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :posts
  resources :welcome, only: :index

  root to: "welcome#index"
end
