Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :admins, skip: :registrations
  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
