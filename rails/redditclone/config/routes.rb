Rails.application.routes.draw do
  devise_for :users
  resources :links
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to:'links#index'
end
