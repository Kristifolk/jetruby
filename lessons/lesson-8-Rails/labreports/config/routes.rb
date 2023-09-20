Rails.application.routes.draw do
  resources :labreports#метод прописывает все url адреса(Get,post и тд) для контроллера :labreports В браузере http://localhost:3000/rails/info/routes
  root 'labreports#index'#по умолчанию главная стр по labreports метод index
  get 'labreports/:id/mark', to: 'labreports#mark'#для оценки. :id двоеточие говорит о динамическом изменении id
  post 'labreports/:id/mark', to: 'labreports#mark_update'#для оценки. :id двоеточие говорит о динамическом изменении id

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
