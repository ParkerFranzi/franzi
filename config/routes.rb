Franzi::Application.routes.draw do

  resources :galleries do
    resources :pictures
  end
  
  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :destroy_user

  resources :posts do
    resources :comments
  end

  resources :users

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
