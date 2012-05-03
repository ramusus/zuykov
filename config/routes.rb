Project::Application.routes.draw do
  resources :questions

  resources :trademarks

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :news
  resources :articles

  match "/calculator/" => "application#calculator_form", :as => 'calculator_form'
  match "/request/" => "trademarks#new", :as => 'request_form'
  match "/contact/" => "questions#new", :as => 'contact_form'
  match "/:slug/" => "pages#show"
  root :to => "pages#show"

end
