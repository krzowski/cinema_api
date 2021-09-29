include FactoryBot::Syntax::Methods

user = create :user, email: 'user@example.com', password: 'password'
admin = create :admin, email: 'admin@example.com', password: 'password'
movie = create :fetched_movie
pricing_category = create :movie_pricing_category
create :movie_showing, movie: movie, movie_pricing_category: pricing_category, show_time: "10:00"
create :movie_showing, movie: movie, movie_pricing_category: pricing_category, show_time: "12:00"
create :movie_rating, movie: movie, user: user
