require 'swagger_helper'

RSpec.describe 'api/v1/movie_showings', type: :request do

  path '/api/v1/movie_showings' do

    get('list movie_showings') do
      tags "MovieShowings#index"
      consumes "application/json"
      security [ client: [], access_token: [], uid: [] ]

      response(200, 'successful') do
        before do
          create_list(:movie_showing, 2)
        end

        let(:headers) { create(:user).create_new_auth_token }
        let(:client) { headers['client'] }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        run_test!
      end
    end
  end
end
