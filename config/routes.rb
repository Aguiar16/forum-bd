Rails.application.routes.draw do
  resources :replies, :except => [:index]
  resources :posts
  resources :topics
  devise_for :users
  root "topics#index"
  # get "replies/" => redirect("topics#index")
  # get "posts/" => redirect("topics#index")
  # get "posts/new/:topicId", to: "posts#new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
