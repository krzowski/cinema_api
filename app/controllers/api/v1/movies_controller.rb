module Api::V1
  class MoviesController < BaseController
    def show
      movie = Movie.find(params[:id])
      data = MovieSerializer.new(movie).serializable_hash

      render json: data, status: :ok
    end
  end
end
