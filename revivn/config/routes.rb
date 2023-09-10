Rails.application.routes.draw do
  resources :pickup_statuses
  resources :pickup_items
  resources :pickups
  resources :orgs
  resources :users
  resources :hardware_types
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
