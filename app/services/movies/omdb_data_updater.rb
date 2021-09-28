module Movies
  class OmdbDataUpdater
    def initialize(movie_id:, omdb_data: nil)
      @movie_id = movie_id
      @omdb_data = omdb_data
    end

    def call
      result = Schemas::OmdbData.call(omdb_data)
      return false if result.failure?

      movie.update(
        omdb_data: result.to_h,
        omdb_data_updated_at: Time.current
      )
    rescue ActiveRecord::RecordNotFound
      false
    end

    private

    def movie
      @movie ||= Movie.find(@movie_id)
    end

    def omdb_data
      @omdb_data || OmdbDataFetcher.new(movie.imdb_id).call
    end
  end
end
