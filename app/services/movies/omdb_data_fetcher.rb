module Movies
  class OmdbDataFetcher
    def initialize(imdb_id)
      @imdb_id = imdb_id
    end

    def call
      response = HTTParty.get(path)
      return false if !response.success? || response["Error"]

      JSON.parse(response.body)
    rescue HTTParty::Error
      false
    end

    private

    def path
      api_key = Rails.application.credentials.omdb_api_key
      "http://www.omdbapi.com/?apikey=#{api_key}&i=#{@imdb_id}"
    end
  end
end
