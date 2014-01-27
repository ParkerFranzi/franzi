Franzi::Application.routes.draw do

  get "comments/create"

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :users, only: [:show, :destroy]

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
