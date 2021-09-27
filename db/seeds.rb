include FactoryBot::Syntax::Methods

user = create :user, email: 'user@example.com', password: 'password'
admin = create :admin, email: 'admin@example.com', password: 'password'
movie = create :fetched_movie
