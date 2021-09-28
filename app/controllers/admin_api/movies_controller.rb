module AdminApi
  class MoviesController < BaseController
    def create
      call_action { Movies::Operations::CreateMovie.new.call(movie_params) }
    end

    private

    def movie_params
      params.to_unsafe_hash['movie']
    end
  end
end
