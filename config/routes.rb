FourCouch::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  match "/users/:id/edit/:section" => "users#edit", :via => :get
  resources :users do
    resources :communities
    resources :couches
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :couches
  resources :communities

  root :to => 'home#index'
  get  'search' => 'home#search'
end
