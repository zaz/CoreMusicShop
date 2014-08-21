Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :brands
  resources :products, path: 'items', except: :index
  get '/!*type', to: 'products#index'
  get '/', to: 'products#index'
end
