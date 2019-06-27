Rails.application.routes.draw do
  root 'pages#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :orders, only: %i[index show]
  get 'find_order', to: 'orders#find'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
