Rails.application.routes.draw do
  resources :passwords, only: [:show, :new, :create, :destroy]
  root 'passwords#new'
  get '/passwords', to: redirect('/passwords/new')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
