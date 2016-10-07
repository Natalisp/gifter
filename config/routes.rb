Rails.application.routes.draw do
  get 'welcome/home'
  root to: 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
    resources :wishlists, only: [:index, :show]
 end
  resources :comments
  resources :friendships

  resources :wishlists, only: [:show] do
    resources :gifts, only: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
