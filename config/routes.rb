Franzi::Application.routes.draw do

  get "comments/create"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :posts do
    resources :comments
  end

  resources :users, only: [:show]

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
