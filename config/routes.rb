Rails.application.routes.draw do

  resources :orders
  resources :ordered_books
  resources :categories
  resources :books

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'landing#index'
  get :about, to: 'static_pages#about'

end
