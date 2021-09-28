module Movies
  class UpdateOmdbDataJob < ApplicationJob
    queue_as :default

    def perform(movie_id)
      Movies::OmdbDataUpdater.new(movie_id: movie_id).call
    end
  end
end
