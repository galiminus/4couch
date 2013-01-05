FourCouch::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }

  match "/users/:id/edit/:section" => "users#edit", :via => :get
  resources :users do

    match "/conversations/:recipient_id" => "conversations#show", :via => :get
    match "/conversations/:recipient_id/messages" => "messages#create", :via => :post

    resources :conversations, :only => [:show, :index] do
      resources :messages, :only => [:new, :create]
    end

    resource :place, :controller => 'users_places'
  end

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :places, :only => [:index]
  resources :cities, :only => [:index]

  root :to => 'home#index'
end
