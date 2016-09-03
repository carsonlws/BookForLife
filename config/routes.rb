Rails.application.routes.draw do

  # devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :orders
  resources :ordered_books
  resources :categories
  resources :books

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'landing#index'
  get :about, to: 'static_pages#about'

  get :cart, to: 'cart#show'
  patch :add_item_to_cart, to: 'cart#add_item'
  delete :clear_cart, to:'cart#clear_cart'

end
