Project::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :news
  resources :articles

  match "/calculator/" => "application#calculator"
  match "/request/" => "application#request"
  match "/:slug/" => "pages#show"
  root :to => "pages#show"

end
