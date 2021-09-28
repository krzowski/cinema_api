require 'rails_helper'

RSpec.describe MovieSerializer, type: :serializer do
  it "serializes :id, :imdb_id, :omdb_data, :omdb_data_updated_at attributes" do
    serializable_attrs = [:id, :imdb_id, :omdb_data, :omdb_data_updated_at]
    movie = create :fetched_movie
    serialized_data = MovieSerializer.new(movie).serializable_hash
    expect(serialized_data[:data][:attributes].keys).to match_array(serializable_attrs)
  end
end
