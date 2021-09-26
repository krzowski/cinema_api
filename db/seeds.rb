# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  email: 'user@example.com',
  password: 'password'
)

admin = Admin.create(
  email: 'admin@example.com',
  password: 'password'
)

movie = Movie.create(
  imdb_id: 'tt0232500',
  omdb_data: {
    "Title"=>"The Fast and the Furious",
    "Year"=>"2001",
    "Rated"=>"PG-13",
    "Released"=>"22 Jun 2001",
    "Runtime"=>"106 min",
    "Genre"=>"Action, Crime, Thriller",
    "Director"=>"Rob Cohen",
    "Writer"=>"Ken Li, Gary Scott Thompson, Erik Bergquist",
    "Actors"=>"Vin Diesel, Paul Walker, Michelle Rodriguez",
    "Plot"=>"Los Angeles police officer Brian O'Conner must decide where his loyalty really lies when he becomes enamored with the street racing world he has been sent undercover to destroy.",
    "Language"=>"English, Spanish",
    "Country"=>"United States, Germany",
    "Awards"=>"11 wins & 18 nominations",
    "Poster"=>"https://m.media-amazon.com/images/M/MV5BNzlkNzVjMDMtOTdhZC00MGE1LTkxODctMzFmMjkwZmMxZjFhXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg",
    "Ratings"=>[{"Source"=>"Internet Movie Database", "Value"=>"6.8/10"}, {"Source"=>"Rotten Tomatoes", "Value"=>"54%"}, {"Source"=>"Metacritic", "Value"=>"58/100"}],
    "Metascore"=>"58",
    "imdbRating"=>"6.8",
    "imdbVotes"=>"367,679",
    "imdbID"=>"tt0232500",
    "Type"=>"movie",
    "DVD"=>"03 Jun 2003",
    "BoxOffice"=>"$144,533,925",
    "Production"=>"Original Film, Neal H. Moritz Productions, Universal Pictures",
    "Website"=>"N/A",
    "Response"=>"True"
  },
  omdb_data_updated_at: Time.current
)
