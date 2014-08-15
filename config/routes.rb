Rails.application.routes.draw do
  resources :brands
  resources :products, path: 'items', except: :index
  get '/!*type', to: 'products#index'
  get '/', to: 'products#index'
end
