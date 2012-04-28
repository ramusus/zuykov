Project::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :news
  resources :articles

  match "/calculator/" => "application#calculator_form", :as => 'calculator_form'
  match "/request/" => "application#request_form", :as => 'request_form'
  match "/contact/" => "application#contact_form", :as => 'contact_form'
  match "/:slug/" => "pages#show"
  root :to => "pages#show"

end
