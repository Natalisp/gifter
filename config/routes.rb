Rails.application.routes.draw do
  root to: 'welcome#home'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: "registrations" }

  resources :users, only: [:index, :show] do
    resources :wishlists
  end

  resources :gifts do
      resources :comments, except: [:edit]
  end

  resources :friendships, only: [:index, :create, :destroy]

  resources :wishlist_gifts, :only => [:create, :destroy]


  # Catch-all route, redirects to root
   match '*path', to: redirect('/'), via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
