FourCouch::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  match "/users/:id/edit/:section" => "users#edit", :via => :get
  resources :users do
    resources :communities, :controller => 'users_communities'
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :places
  resources :communities
  resources :cities, :only => [:index]

  root :to => 'home#index'
end
