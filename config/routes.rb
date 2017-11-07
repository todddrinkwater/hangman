Rails.application.routes.draw do
  get 'start/index'

  resources :game
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'start#index'
end
