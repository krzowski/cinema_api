require 'rails_helper'

RSpec.describe Movies::OmdbDataFetcher do
  it "fetches movie data by imbd_id" do
    movie_attrs = attributes_for :fetched_movie
    imdb_id = movie_attrs[:imdb_id]

    VCR.use_cassette("omdb_movie_#{imdb_id}") do
      response_body = described_class.new(imdb_id).call
      expect(response_body.keys).to eq(movie_attrs[:omdb_data].keys)
    end
  end

  it "returns false with incorrect imdb_id" do
    imdb_id = "23"

    VCR.use_cassette("omdb_movie_#{imdb_id}") do
      response = described_class.new(imdb_id).call
      expect(response).to eq(false)
    end
  end
end
