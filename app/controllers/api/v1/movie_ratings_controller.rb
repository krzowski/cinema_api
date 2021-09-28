module Api::V1
  class MovieRatingsController < BaseController
    def create
      call_action do
        MovieRatings::Operations::CreateRating.new.call(
          movie_rating_params.merge(user_id: current_user.id)
        )
      end
    end

    private

    def movie_rating_params
      params.to_unsafe_hash['movie_rating']
    end
  end
end
