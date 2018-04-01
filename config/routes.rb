Rails.application.routes.draw do
  root 'home#index'
  scope '/:locale' do

    resources :admins
    # devise_for :admins,
    #            skip: :registrations,
    #            controllers: { sessions: 'admins/sessions' }

    devise_for :users

  end  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
