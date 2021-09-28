# == Schema Information
#
# Table name: movie_ratings
#
#  id         :bigint           not null, primary key
#  rating     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  movie_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_movie_ratings_on_movie_id  (movie_id)
#  index_movie_ratings_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (user_id => users.id)
#
class MovieRating < ApplicationRecord
  belongs_to :movie
  belongs_to :user
end
