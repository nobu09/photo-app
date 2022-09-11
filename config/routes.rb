Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'sessions#new'

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get  'photos',     to: 'photos#index'
  post 'photos',     to: 'photos#create'
  get  'photos/new', to: 'photos#new', as: 'new_photo'
end
