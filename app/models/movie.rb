# == Schema Information
#
# Table name: movies
#
#  id                   :bigint           not null, primary key
#  omdb_data            :jsonb            not null
#  omdb_data_updated_at :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  imdb_id              :string           not null
#
class Movie < ApplicationRecord
  has_many :movie_showings
  has_many :movie_ratings
end
