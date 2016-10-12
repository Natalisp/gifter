Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show]

  resources :users do
    resources :wishlists
  end

  # resources :gifts
  resources :gifts do
      resources :comments
  end

  resources :friendships

  resources :wishlist_gifts, :only => [:create, :destroy]

  # resources :wishlists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
