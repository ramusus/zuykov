Project::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
  resources :news
  resources :articles

  match "/:slug/" => "pages#show"
  root :to => "pages#show"

end
