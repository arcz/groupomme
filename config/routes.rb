Groupomme::Application.routes.draw do
  devise_for :users
  resources :users

  resource :user do
    resources :search, only: :index, controller: 'user/search'
  end

  root 'home#index'
  resources :groups do
    resources :posts, only: :create
    resources :members, only: [:index, :create, :destroy], controller: 'groups/members'
    resource :join, only: [:create, :destroy], controller: 'groups/join'
  end
  resources :posts do
    resources :comments
  end
end
