Rails.application.routes.draw do
  get 'shop/index'
  root 'shop#index'
  resources :categories do
    resources :products
  end
end
