class MovieSerializer
  include JSONAPI::Serializer
  attributes :id, :imdb_id, :omdb_data, :omdb_data_updated_at
  attribute :rating do |object|
    object.movie_ratings.average(:rating)
  end
end
