Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]

  resources :users, only: [:show] do
    resources :wishlists, only: [:index, :show]
  end
  resources :gifts, only: [:show]
  resources :comments
  resources :friendships
  resources :wishlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
