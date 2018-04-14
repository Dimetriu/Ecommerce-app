Rails.application.routes.draw do
  root 'home#index'
  
  devise_for :users, only: :omniauth_callbacks, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  scope '(:locale)' do
    devise_for :admins, skip: :registrations
    devise_for :users,  skip: :omniauth_callbacks
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
