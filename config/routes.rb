FourCouch::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  match "/users/:id/edit/:section" => "users#edit", :via => :get
  resources :users do
    resource :place, :controller => 'users_places'
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :places, :only => [:index]
  resources :cities, :only => [:index]

  root :to => 'home#index'
end
