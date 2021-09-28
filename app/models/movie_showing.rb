# == Schema Information
#
# Table name: movie_showings
#
#  id                        :bigint           not null, primary key
#  show_time                 :time             not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  movie_id                  :bigint           not null
#  movie_pricing_category_id :bigint           not null
#
# Indexes
#
#  index_movie_showings_on_movie_id                   (movie_id)
#  index_movie_showings_on_movie_pricing_category_id  (movie_pricing_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#  fk_rails_...  (movie_pricing_category_id => movie_pricing_categories.id)
#
class MovieShowing < ApplicationRecord
  belongs_to :movie
  belongs_to :movie_pricing_category
end
