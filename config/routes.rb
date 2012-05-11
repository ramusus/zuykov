Project::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :news, :only => [:index, :show]
  resources :articles, :only => [:index, :show]
  resources :questions, :only => [:new, :create]
  resources :trademarks, :only => [:new, :create]

  match "/calculator/" => "application#calculator_form", :as => 'calculator_form'
  match "/request/" => "trademarks#new", :as => 'request_form'
  match "/contact/" => "questions#new", :as => 'contact_form'
  match "/:slug/" => "pages#show"
  root :to => "pages#show"

end
