class MovieShowingSerializer
  include JSONAPI::Serializer
  attributes :movie_id
  attribute :show_time do |object|
    object.show_time.strftime("%H:%M")
  end
end
