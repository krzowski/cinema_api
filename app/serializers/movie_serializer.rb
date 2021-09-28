class MovieSerializer
  include JSONAPI::Serializer
  attributes :id, :imdb_id, :omdb_data, :omdb_data_updated_at
end
