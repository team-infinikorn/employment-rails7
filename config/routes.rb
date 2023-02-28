Rails.application.routes.draw do
  get 'personal_data/index'
  post 'personal_data/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#index"

  resources :employers, only: [:index, :new, :create]
  get 'pages/index'
end
