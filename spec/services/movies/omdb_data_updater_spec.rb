require 'rails_helper'

RSpec.describe Movies::OmdbDataUpdater do
  it "updates omdb_data and omdb_data_updated_at" do
    movie = create :movie
    omdb_data = attributes_for(:fetched_movie)[:omdb_data]
    result = described_class.new(movie_id: movie.id, omdb_data: omdb_data).call
    movie.reload
    expect(movie.omdb_data).to eq(omdb_data)
    expect(movie.omdb_data_updated_at).to be_present
  end

  it "returns false if omdb_data is invalid" do
    movie = create :movie
    result = described_class.new(movie_id: movie.id, omdb_data: "Some invalid data").call
    expect(result).to be(false)
  end

  it "returns false if Movie record doesn't exist" do
    result = described_class.new(movie_id: 1).call
    expect(result).to be(false)
  end
end
