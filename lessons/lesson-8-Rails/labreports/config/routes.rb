Rails.application.routes.draw do
  resources :grades
  resources :labreports
  get 'labreports/new', to: 'labreports#new'#добавила не помогло
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
