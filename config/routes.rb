Groupomme::Application.routes.draw do
  devise_for :users
  resources :users
  root 'home#index'
  resources :groups do
    resources :posts, only: :create
    resources :members, only: [:index, :create, :destroy], controller: 'groups/members'
    resource :join, only: [:create, :destroy], controller: 'groups/join'
  end
end
