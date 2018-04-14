Rails.application.routes.draw do
  root 'home#index'
  scope '(:locale)' do
    devise_for :admins, skip: :registrations
    devise_for :users
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
