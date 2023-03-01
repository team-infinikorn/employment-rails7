Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "pages#index"

  resources :employers, only: [:index, :new, :create]
  resources :personal_data, except: [:destroy]
  get 'pages/index'
end
