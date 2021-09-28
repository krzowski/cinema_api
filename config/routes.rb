Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  mount_devise_token_auth_for 'User', at: 'api/auth', skip: [:registrations, :passwords]
  mount_devise_token_auth_for 'Admin', at: 'admin_api/auth', skip: [:registrations, :passwords]

  namespace :admin_api do
    resources :movies, only: :create
    resources :movie_pricing_categories, only: [:create, :update]
    resources :movie_showings, only: [:create, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :movies, only: :show
      resources :movie_showings, only: :index
    end
  end
end
