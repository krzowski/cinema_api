require 'swagger_helper'

RSpec.describe 'devise_token_auth', type: :request do

  path '/api/auth/sign_in' do

    post('create user session') do
      tags "Auth#Sessions"
      consumes "application/json"
      parameter name: 'user', in: :body, schema: {
        type: 'object',
        properties: {
          email: { type: 'string' },
          password: { type: 'string' },
        },
        required: %w[email password]
      }

      response(200, 'authorized') do
        let(:user) { attributes_for(:user) }

        before do
          User.create(user)
        end

        run_test!
      end

      response(401, 'unauthorized') do
        let(:user) { attributes_for(:user) }

        run_test!
      end
    end
  end

  path '/api/auth/sign_out' do

    delete('delete user session') do
      tags "Auth#Sessions"
      consumes "application/json"
      security [ client: [], access_token: [], uid: [] ]

      response(200, 'successful') do
        let(:headers) { create(:user).create_new_auth_token }
        let(:client) { headers['client'] }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        run_test!
      end

      response(404, 'failed') do
        let(:headers) { create(:user).create_new_auth_token }
        let(:client) { 'nonexitent' }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        run_test!
      end
    end
  end
end
