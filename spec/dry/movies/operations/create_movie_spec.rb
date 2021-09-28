require 'rails_helper'

RSpec.describe Movies::Operations::CreateMovie do
  subject(:operation) { described_class.new }

  it "creates a movie with valid params" do
    allow(Movies::UpdateOmdbDataJob).to receive(:perform_later)
    initial_movie_count = Movie.count

    result = operation.call(attributes_for(:movie))
    expect(result).to be_success
    expect(Movie.count).to eq(initial_movie_count + 1)
  end

  it "fails to create a movie with invalid params" do
    result = operation.call({})
    expect(result).to be_failure
  end
end
