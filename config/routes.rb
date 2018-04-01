Rails.application.routes.draw do
  
  devise_for :admins
  root 'home#index'
  
  devise_for :users
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
