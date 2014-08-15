Rails.application.routes.draw do
  resources :brands

  get '/!*type', to: 'products#index'
  resources :products, path: ''
end
