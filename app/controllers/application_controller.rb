require 'dry/matcher/result_matcher'

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def call_action
    Dry::Matcher::ResultMatcher.call(yield) do |m|
      m.success(:created) do |_, result|
        render json: { data: result }, status: :created
      end

      m.success do
        head :ok
      end

      m.failure(Dry::Validation::Result) do |result|
        render json: { errors: result.errors.to_h }, status: :unprocessable_entity
      end

      m.failure do
        head :internal_server_error
      end
    end
  end

  def not_found
    head :not_found
  end
end
