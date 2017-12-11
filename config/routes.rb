Rails.application.routes.draw do
  match '/users',   to: 'users#index',   via: 'get'

  get 'links/approved'
  devise_for :users
  resources :categories
  resources :links
  root 'links#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
