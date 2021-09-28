module Movies
  module Schemas
    OmdbDataRating = Dry::Schema.JSON do
      required(:Source).value(:string)
      required(:Value).value(:string)
    end

    OmdbData = Dry::Schema.JSON do
      required(:Title).value(:string)
      required(:Year).value(:string)
      required(:Rated).value(:string)
      required(:Released).value(:string)
      required(:Runtime).value(:string)
      required(:Genre).value(:string)
      required(:Director).value(:string)
      required(:Writer).value(:string)
      required(:Actors).value(:string)
      required(:Plot).value(:string)
      required(:Language).value(:string)
      required(:Country).value(:string)
      required(:Awards).value(:string)
      required(:Poster).value(:string)
      required(:Ratings).array(OmdbDataRating)
      required(:Metascore).value(:string)
      required(:imdbRating).value(:string)
      required(:imdbVotes).value(:string)
      required(:imdbID).value(:string)
      required(:Type).value(:string)
      required(:DVD).value(:string)
      required(:BoxOffice).value(:string)
      required(:Production).value(:string)
      required(:Website).value(:string)
      required(:Response).value(:string)
    end
  end
end
