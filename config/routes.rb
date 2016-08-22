Rails.application.routes.draw do

  devise_for :users
  
  resources :users, only: [:show] do 
    resources :items, only: [:create, :destroy]
  end

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end 

  root to: 'welcome#index'
  
  get 'welcome/index'

  get 'welcome/about'
end