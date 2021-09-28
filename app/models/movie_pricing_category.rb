# == Schema Information
#
# Table name: movie_pricing_categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  price      :decimal(11, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class MoviePricingCategory < ApplicationRecord
  has_many :movie_showings
end
