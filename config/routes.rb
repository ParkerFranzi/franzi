Franzi::Application.routes.draw do

  get "comments/create"

  devise_for :users

  resources :posts do
    resources :comments, only: [:create]
  end

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
