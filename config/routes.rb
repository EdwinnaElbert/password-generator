Rails.application.routes.draw do
  resources :passwords, only: [:show, :new, :create]
  get 'passwords/new'

  get 'passwords/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
