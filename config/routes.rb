FourCouch::Application.routes.draw do
    devise_for :users, :controllers => { :registrations => "registrations" }
    resources :users

    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

    resources :couches
    resources :communities

    root :to => 'home#index'
end
