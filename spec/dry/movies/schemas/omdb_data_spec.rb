require 'rails_helper'

RSpec.describe Movies::Schemas::OmdbData do
  subject(:schema) { described_class }

  it "validates correctly expected OMDb api data" do
    omdb_data = attributes_for(:fetched_movie)[:omdb_data]
    result = schema.call(omdb_data)
    expect(result).to be_success
  end

  it "shows errors for other api data" do
    omdb_data = attributes_for(:fetched_movie)[:omdb_data].slice("Title", "Genre")
    result = schema.call(omdb_data)
    expect(result).to be_failure
  end
end
