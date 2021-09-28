require 'swagger_helper'

RSpec.describe 'api/v1/movies', type: :request do

  path '/api/v1/movies/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show movie') do
      tags "Movies#get"
      consumes "application/json"
      security [ client: [], access_token: [], uid: [] ]

      response(200, 'successful') do
        before do
          @movie = create :movie
        end

        let(:headers) { create(:user).create_new_auth_token }
        let(:client) { headers['client'] }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        let(:id) { @movie.id }

        run_test!
      end

      response(404, 'not found') do
        let(:headers) { create(:user).create_new_auth_token }
        let(:client) { headers['client'] }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        let(:id) { 404 }

        run_test!
      end
    end
  end
end
