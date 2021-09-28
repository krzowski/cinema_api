require 'swagger_helper'

RSpec.describe 'api/v1/movie_ratings', type: :request do

  path '/api/v1/movie_ratings' do

    post('create movie_rating') do
      tags "MovieRatings#create"
      consumes "application/json"
      security [ client: [], access_token: [], uid: [] ]
      parameter name: 'movie_rating', in: :body, schema: {
        type: 'object',
        properties: {
          movie_id: { type: 'string' },
          rating: { type: 'string' },
        },
        required: %w[movie_id rating]
      }

      response(201, 'successful') do
        before do
          @user = create(:user)
          @movie = create(:movie)
        end

        let(:headers) { @user.create_new_auth_token }
        let(:client) { headers['client'] }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        let(:movie_rating) { { movie_id: @movie.id, rating: 4 } }

        run_test!
      end

      response(422, 'unprocessable') do
        before do
          @user = create(:user)
          @movie = create(:movie)
        end

        let(:headers) { @user.create_new_auth_token }
        let(:client) { headers['client'] }
        let('access-token') { headers['access-token'] }
        let(:uid) { headers['uid'] }

        let(:movie_rating) { { movie_id: @movie.id, rating: 6 } }

        run_test!
      end
    end
  end
end
