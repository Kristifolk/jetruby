Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

    root "main#index"
    get "likes/check_like/:id", to: "likes#check_like", as: "like_post"
    get "likes/check_dislike/:id", to: "likes#check_dislike", as: "dislike_post"
    get "friends/:post_user_id", to: "friends#friendly", as: "friendly_post"
end
