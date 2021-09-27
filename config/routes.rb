Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  mount_devise_token_auth_for 'User', at: 'api/auth', skip: [:registrations, :passwords]
  mount_devise_token_auth_for 'Admin', at: 'admin_api/auth', skip: [:registrations, :passwords]
end
