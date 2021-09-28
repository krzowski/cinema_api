require 'rails_helper'

RSpec.describe MovieRatings::Validators::UpdateRating do
  subject(:validator) { described_class.new }

  it "validates presence of :user_id, :movie_id, :rating" do
    result = validator.({})
    expect(result).to be_failure
    expect(result.errors[:user_id]).to eql(["is missing"])
    expect(result.errors[:movie_id]).to eql(["is missing"])
    expect(result.errors[:rating]).to eql(["is missing"])
  end

  it "validates presence of user, movie associations" do
    result = validator.({
      user_id: "404",
      movie_id: "404",
    })
    expect(result).to be_failure
    expect(result.errors[:user_id]).to eql(["user doesn't exists"])
    expect(result.errors[:movie_id]).to eql(["movie doesn't exists"])
  end

  it "validates uniqueness of [:user_id, :movie_id]" do
    rating = create(:movie_rating)
    result = validator.({
      user_id: rating.user_id,
      movie_id: rating.movie_id,
      rating: '3'
    })
    expect(result).to be_failure
    expect(result.errors[:movie_id]).to eql(["already rated"])
  end

  it "validates show_time format" do
    result = validator.({rating: '6'})
    expect(result).to be_failure
    expect(result.errors[:rating]).to eql(["is out of range"])
  end

  it "results in success with correct data" do
    user = create(:user)
    movie = create(:movie)
    params = {
      user_id: user.id,
      movie_id: movie.id,
      rating: '3'
    }
    result = validator.(params)
    expect(result).to be_success
  end
end
