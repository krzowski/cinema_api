
# Setup
## requirements
* Ruby 3.0.2
* Rails 6.1.4.1
* Postgres 10+

## install gems and setup db

`bundle install`

`bundle exec rails db:setup`

App contains seeded data.

## run tests

`bundle exec rspec spec/`

## start server

`bundle exec rails s`

## swagger documentation

Documentation is available at http://localhost:3000/api-docs/index.html

Authenticated paths require 3 headers to be entered (Swagger displays them as separate authorization methods, but it's only a bug in UI).

Documentation can be regenerated with: `rails rswag`.

## Get auth credentials

For Admin:

```bash
curl -v -X POST "http://localhost:3000/admin_api/auth/sign_in" \
  -H "accept: application/json" \
  -H  "Content-Type: application/json" \
  -d "{  \"email\": \"admin@example.com\",  \"password\": \"password\"}" 2>&1 \
  | grep -e "client" -e "access-token" -e "uid"
```

for User:

```bash
curl -v -X POST "http://localhost:3000/api/auth/sign_in" \
  -H "accept: application/json" \
  -H  "Content-Type: application/json" \
  -d "{  \"email\": \"user@example.com\",  \"password\": \"password\"}" 2>&1 \
  | grep -e "client" -e "access-token" -e "uid"
```


# Implementation choices:

## User types

I've decided to create two models for users as the roles of cinema owners and their clients fundamentally differ:
- Admin - owner account
- User - client account

This separation will make it straightforward to implement functionalities like administration panel, ability to add friends, or other things clearly related to only one type of the user.


## Cinema business rules:

1. Movie model holds all OMDb movie data.
We'll want to avoid synchronous checks for the OMDb data each time user requests it. Requirements don't mandate data to be polled real-time, and the data itself isn't likely to change. A request to OMDb API
will be made in a background job after creating a Movie with IMDb ID by Admin. A result will be persisted in the database.

Later on we can update the OMDb data periodically, e.g. with whenever or clockwork.

2. MovieShowing represents a specific hour (show_time) when the movie is shown. A Movie can have many MovieShowings.

Later on we can add start_date and end_date columns to restrict showing to a time frame.

3. MoviePricingCategory allows to associate price with many MovieShowings. Older movies may be offered for a lower price than the latest ones, earlier hours priced differently than latter hours etc.

Later on we can introduce PriceModifier model to alter the price for selected customer groups (e.g. seniors, students).

4. MovieRating holds user rating value for a Movie. Rating value is constrained to be between 1-5.


## Postgres database
Postgres comes with a wide range of tools and extensions available to further enhance database capabilities.

I share the view that you should use SQL databases unless you have a specific reason not to, and are aware of trade-offs (document-based DB records may have missing fields as there's no schema; you may trade consistency for speed etc.).


## Authentication
Any publicly reachable app needs authentication. I've decided to use token authentication with devise_token_auth. It supports multiple user models out of the box and allows for a further integration with OAuth 2.0 providers via omniauth.


## Dry-rb
I've used dry-validation to decouple validation logic from AR models.

I've created operations with dry-monads to isolate and manage steps performed during create/update actions.

An interface/schema for omdb data was defined with dry-schema.


## Handling secrets:
Encrypted config/credentials.yml.enc file is commited to the repo.

The encryption key is stored in config/master.key file and is not commited to git.

A Key template can be found at config/master.key_example.


Edit credentials:

`EDITOR="vim.tiny" bin/rails credentials:edit`



# Further Notes:

- Authentication: I've turned off refreshing access tokens with each request, but it's preferable to reenable it for production.
- Admin routes are meant to be internal, thus swagger docs were not generated for them. Furthermore, /admin_api/ route is restricted separately by CORS.
- Associations should be reviewed for dependent/destroy relation.
- Movie rating is calculated by SQL AVG function. A more performant solution like persisting average rating in a movie column will be required with a moderate-size user base.
- exception_notification gem can be set up to alert about internal server errors.
