Rails.application.routes.draw do
<<<<<<< HEAD
  resources :links
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
=======
  resources :comments
  devise_for :users
  resources :links do
    member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
  resources :comments
  end
  root to: 'links#index'
end
>>>>>>> project_reddit_clone
