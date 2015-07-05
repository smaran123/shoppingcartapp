Rails.application.routes.draw do
  root 'homes#index'
  resources :categories
  resources :products
  resources :homes
end
