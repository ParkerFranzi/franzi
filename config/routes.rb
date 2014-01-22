Franzi::Application.routes.draw do

  devise_for :views

  resources :posts

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
