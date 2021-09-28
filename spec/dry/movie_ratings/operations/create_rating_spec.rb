require 'rails_helper'

RSpec.describe MovieRatings::Operations::CreateRating do
  subject(:operation) { described_class.new }

  it "creates rating with valid params" do
    user = create :user
    movie = create :movie
    initial_ratings_count = MovieRating.count
    params = {
      user_id: user.id,
      movie_id: movie.id,
      rating: 3
    }

    result = operation.call(params)
    expect(result).to be_success
    expect(MovieRating.count).to eq(initial_ratings_count + 1)
  end

  it "fails to create rating with invalid params" do
    result = operation.call({})
    expect(result).to be_failure
  end
end
