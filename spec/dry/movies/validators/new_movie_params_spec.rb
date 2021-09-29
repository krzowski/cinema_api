require 'rails_helper'

RSpec.describe Movies::Validators::NewMovieParams do
  subject(:validator) { described_class.new }

  it "validates presence of :imdb_id" do
    result = validator.({})
    expect(result).to be_failure
    expect(result.errors[:imdb_id]).to eql(["is missing"])
  end

  it "validates uniqueness of :imdb_id" do
    movie = create :movie
    result = validator.({ imdb_id: movie.imdb_id })
    expect(result).to be_failure
    expect(result.errors[:imdb_id]).to eql(["already exists"])
  end

  it "results in success with correct data" do
    params = attributes_for(:movie)
    result = validator.(params)
    expect(result).to be_success
    expect(result.to_h).to eq(params)
  end
end
