Rails.application.routes.draw do
  resources :books
  resources :authors
  # root "authors#index"
  root "authors#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
