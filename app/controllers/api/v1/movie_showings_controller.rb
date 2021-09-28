module Api::V1
  class MovieShowingsController < BaseController
    def index
      showings = MovieShowing.all
      data = MovieShowingSerializer.new(showings).serializable_hash

      render json: data, status: :ok
    end
  end
end
