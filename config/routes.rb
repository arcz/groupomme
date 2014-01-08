Groupomme::Application.routes.draw do
  devise_for :users
  resources :users
  root 'home#index'
  resources :groups do
    resources :posts
    resources :members
    resource :join, controller: 'groups/join'
  end
end
